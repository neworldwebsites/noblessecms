<?php

class Comments
{

	public function get($inputData=array())
	{

		$limitQuery="";

		$limitShow=isset($inputData['limitShow'])?$inputData['limitShow']:0;

		$limitPage=isset($inputData['limitPage'])?$inputData['limitPage']:0;

		$limitPage=((int)$limitPage > 0)?$limitPage:0;

		$limitPosition=$limitPage*(int)$limitShow;

		$limitQuery=((int)$limitShow==0)?'':" limit $limitPosition,$limitShow";

		$limitQuery=isset($inputData['limitQuery'])?$inputData['limitQuery']:$limitQuery;

		$field="commentid,postid,type,fullname,email,parentid,date_added,status,content";

		$selectFields=isset($inputData['selectFields'])?$inputData['selectFields']:$field;

		$whereQuery=isset($inputData['where'])?$inputData['where']:'';

		$orderBy=isset($inputData['orderby'])?$inputData['orderby']:'order by commentid desc';

		$result=array();
		
		$command="select $selectFields from comments $whereQuery";

		$command.=" $orderBy";

		$queryCMD=isset($inputData['query'])?$inputData['query']:$command;

		$queryCMD.=$limitQuery;

		$cache=isset($inputData['cache'])?$inputData['cache']:'yes';
		
		$cacheTime=isset($inputData['cacheTime'])?$inputData['cacheTime']:1;

		if($cache=='yes')
		{
			// Load dbcache

			$loadCache=DBCache::get($queryCMD,$cacheTime);

			if($loadCache!=false)
			{
				return $loadCache;
			}

			// end load			
		}


		$query=Database::query($queryCMD);
		
		if(isset(Database::$error[5]))
		{
			return false;
		}

		$inputData['isHook']=isset($inputData['isHook'])?$inputData['isHook']:'yes';
		
		if((int)$query->num_rows > 0)
		{
			while($row=Database::fetch_assoc($query))
			{
				if(isset($row['fullname']))
				{
					$row['fullname']=String::decode($row['fullname']);
				}
				if(isset($row['content']))
				{
					$row['content']=String::decode($row['content']);
				}

				if(isset($row['date_added']))
				$row['date_addedFormat']=Render::dateFormat($row['date_added']);	

				if($inputData['isHook']=='yes')
				{
					if(isset($row['content']))
					$row['content']=Shortcode::toHTML($row['content']);
				}
											
				$result[]=$row;
			}		
		}
		else
		{
			return false;
		}
		
		// Save dbcache
		DBCache::make(md5($queryCMD),$result);
		// end save


		return $result;
		
	}

	public function insert($inputData=array())
	{
		// End addons
		// $totalArgs=count($inputData);

		$addMultiAgrs='';

		if(isset($inputData[0]['postid']))
		{
		    foreach ($inputData as $theRow) {

				$theRow['date_added']=System::dateTime();

				if(isset($theRow['fullname']))
				$theRow['fullname']=String::encode(strip_tags($theRow['fullname']));


				if(isset($theRow['content']))
				{
					$theRow['content']=Shortcode::toBBCode($theRow['content']);

					$theRow['content']=String::encode($theRow['content']);
				}

				$keyNames=array_keys($theRow);

				$insertKeys=implode(',', $keyNames);

				$keyValues=array_values($theRow);

				$insertValues="'".implode("','", $keyValues)."'";

				$addMultiAgrs.="($insertValues), ";

		    }

		    $addMultiAgrs=substr($addMultiAgrs, 0,strlen($addMultiAgrs)-2);
		}
		else
		{		
			$inputData['date_added']=System::dateTime();

			if(isset($inputData['fullname']))
			$inputData['fullname']=String::encode(strip_tags($inputData['fullname']));

			if(isset($inputData['content']))
			{
				$inputData['content']=Shortcode::toBBCode($inputData['content']);

				$inputData['content']=String::encode($inputData['content']);
			}

			$keyNames=array_keys($inputData);

			$insertKeys=implode(',', $keyNames);

			$keyValues=array_values($inputData);

			$insertValues="'".implode("','", $keyValues)."'";	

			$addMultiAgrs="($insertValues)";	
		}		

		Database::query("insert into comments($insertKeys) values".$addMultiAgrs);

		if(!$error=Database::hasError())
		{
			$id=Database::insert_id();

			return $id;	
		}

		return false;
	
	}

	public function remove($post=array(),$whereQuery='',$addWhere='')
	{


		if(is_numeric($post))
		{
			$id=$post;

			unset($post);

			$post=array($id);
		}

		$total=count($post);

		$listID="'".implode("','",$post)."'";

		$whereQuery=isset($whereQuery[5])?$whereQuery:"commentid in ($listID)";

		$addWhere=isset($addWhere[5])?$addWhere:"";

		$command="delete from comments where $whereQuery $addWhere";

		Database::query($command);	

		return true;
	}

	public function update($listID,$post=array(),$whereQuery='',$addWhere='')
	{
		if(isset($post['content']))
		{
			$post['content']=Shortcode::toBBCode($post['content']);

			$post['content']=String::encode(strip_tags($post['content'],'<p><br>'));
		}

		if(is_numeric($listID))
		{
			$catid=$listID;

			unset($listID);

			$listID=array($catid);
		}

		$listIDs="'".implode("','",$listID)."'";		
				
		$keyNames=array_keys($post);

		$total=count($post);

		$setUpdates='';

		for($i=0;$i<$total;$i++)
		{
			$keyName=$keyNames[$i];
			$setUpdates.="$keyName='$post[$keyName]', ";
		}

		$setUpdates=substr($setUpdates,0,strlen($setUpdates)-2);
		
		$whereQuery=isset($whereQuery[5])?$whereQuery:"commentid in ($listIDs)";
		
		$addWhere=isset($addWhere[5])?$addWhere:"";

		Database::query("update comments set $setUpdates where $whereQuery $addWhere");

		if(!$error=Database::hasError())
		{
			return true;
		}

		return false;
	}


}
?>