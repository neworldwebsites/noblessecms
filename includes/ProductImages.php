<?php

class ProductImages
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

		$field="productid,image,sort_order,date_added";

		$selectFields=isset($inputData['selectFields'])?$inputData['selectFields']:$field;

		$whereQuery=isset($inputData['where'])?$inputData['where']:'';

		$orderBy=isset($inputData['orderby'])?$inputData['orderby']:'order by date_added desc';

		$result=array();
		
		$command="select $selectFields from products_images $whereQuery";

		$command.=" $orderBy";

		$queryCMD=isset($inputData['query'])?$inputData['query']:$command;

		$queryCMD.=$limitQuery;

		$cache=isset($inputData['cache'])?$inputData['cache']:'yes';
		
		$cacheTime=isset($inputData['cacheTime'])?$inputData['cacheTime']:1;

		if($cache=='yes')
		{
			// Load dbcache

			$loadCache=DBCache::get($queryCMD,$cacheTime,'system/productimage');

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
				if(isset($row['image']))
				{
					$row['imageUrl']=ROOT_URL.$row['image'];
				}

				if(isset($row['date_added']))
				$row['date_addedFormat']=Render::dateFormat($row['date_added']);	

											
				$result[]=$row;
			}		
		}
		else
		{
			return false;
		}
		
		// Save dbcache
		DBCache::make(md5($queryCMD),$result,'system/productimage');
		// end save


		return $result;
		
	}

	public function insert($inputData=array())
	{
		// End addons
		// $totalArgs=count($inputData);

		$addMultiAgrs='';

		if(isset($inputData[0]['productid']))
		{
		    foreach ($inputData as $theRow) {

				$theRow['date_added']=date('Y-m-d h:i:s');

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
			$inputData['date_added']=date('Y-m-d h:i:s');


			$keyNames=array_keys($inputData);

			$insertKeys=implode(',', $keyNames);

			$keyValues=array_values($inputData);

			$insertValues="'".implode("','", $keyValues)."'";	

			$addMultiAgrs="($insertValues)";	
		}		

		Database::query("insert into products_images($insertKeys) values".$addMultiAgrs);

		DBCache::removeDir('system/productimage');

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

		$whereQuery=isset($whereQuery[5])?$whereQuery:"productid in ($listID)";

		$addWhere=isset($addWhere[5])?$addWhere:"";

		$command="delete from products_images where $whereQuery $addWhere";

		$loadData=self::get(array(
			'where'=>"where productid in ($listID)"
			));

		if(isset($loadData[0]['productid']))
		{
			$total=count($loadData);

			for ($i=0; $i < $total; $i++) { 
				
				$prod=$loadData[0];

				$imgPath=ROOT_PATH.$prod['image'];

				if(file_exists($imgPath))
				{
					unlink($imgPath);

					$imgPath=dirname($imgPath).'/';

					rmdir($imgPath);
				}

			}
		}

		Database::query($command);	
		
		DBCache::removeCache($listID,'system/productimage');

		return true;
	}

	public function update($listID,$post=array(),$whereQuery='',$addWhere='')
	{

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
		
		$whereQuery=isset($whereQuery[5])?$whereQuery:"productid in ($listIDs)";
		
		$addWhere=isset($addWhere[5])?$addWhere:"";

		Database::query("update products_images set $setUpdates where $whereQuery $addWhere");

		// DBCache::removeDir('system/productimage');

		DBCache::removeCache($listIDs,'system/productimage');

		if(!$error=Database::hasError())
		{
			return true;
		}

		return false;
	}


}
?>