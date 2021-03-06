<?php

class Post
{

	public static function get($inputData=array())
	{

		$limitQuery="";

		$limitShow=isset($inputData['limitShow'])?$inputData['limitShow']:0;

		$limitPage=isset($inputData['limitPage'])?$inputData['limitPage']:0;

		$limitPage=((int)$limitPage > 0)?$limitPage:0;

		$limitPosition=$limitPage*(int)$limitShow;

		$limitQuery=((int)$limitShow==0)?'':" limit $limitPosition,$limitShow";

		$limitQuery=isset($inputData['limitQuery'])?$inputData['limitQuery']:$limitQuery;

		$field="postid,title,catid,userid,parentid,image,sort_order,date_added,views,content,type,keywords,friendly_url,is_featured,date_featured,expires_date,rating,allowcomment,status";

		$selectFields=isset($inputData['selectFields'])?$inputData['selectFields']:$field;

		$whereQuery=isset($inputData['where'])?$inputData['where']:'';

		$orderBy=isset($inputData['orderby'])?$inputData['orderby']:'order by postid desc';

		$result=array();
		
		$command="select $selectFields from ".Database::getPrefix()."post $whereQuery";

		$command.=" $orderBy";

		$queryCMD=isset($inputData['query'])?$inputData['query']:$command;

		$queryCMD.=$limitQuery;

		$cache=isset($inputData['cache'])?$inputData['cache']:'yes';
		
		$cacheTime=isset($inputData['cacheTime'])?$inputData['cacheTime']:-1;

		$md5Query=md5($queryCMD);

		if($cache=='yes')
		{
			// Load dbcache

			$loadCache=Cache::loadKey('dbcache/system/post/'.$md5Query,$cacheTime);

			if($loadCache!=false)
			{
				$loadCache=unserialize($loadCache);
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
				if(isset($row['title']))
				{
					$row['title']=String::decode($row['title']);
				}

				if(isset($row['friendly_url']))
				{
					$row['url']=self::url($row);
				}

				if(isset($row['content']))
				{
					$row['content']=String::decode($row['content']);

					// die($row['content']);
				}

				if(isset($row['date_added']))
				{
					$row['date_addedReal']=$row['date_added'];
					
					$row['date_added']=Render::dateFormat($row['date_added']);	
				}
				

				if($inputData['isHook']=='yes')
				{
					if(isset($row['content']))
					{
						$row['content']=String::decode($row['content']);

						$row['content']=html_entity_decode($row['content']);
						
						$row['content']=Shortcode::loadInTemplate($row['content']);

						$row['content']=Shortcode::load($row['content']);
						
						$row['content']=Shortcode::toHTML($row['content']);

						
						
					}
					
				}
											
				$result[]=$row;
			}		
		}
		else
		{
			return false;
		}
		// Save dbcache
		Cache::saveKey('dbcache/system/post/'.$md5Query,serialize($result));

		// end save


		return $result;
		
	}

	public static function getImageFromContent($postid=0)
	{
		$theUri=$postid;

		$savePath=ROOT_PATH.'application/caches/images/'.$theUri.'.cache';

		$fileUrl='';

		if(file_exists($savePath))
		{
			$fileUrl=trim(file_get_contents($savePath));
		}
		else
		{

			$loadData=Post::get(array(
				'isHook'=>'no',
				'cache'=>'yes',
				'cacheTime'=>30,
				'where'=>"where postid='$postid'"
				));

			if(!isset($loadData[0]['image']))
			{
				throw new Exception('This post not exists.');
				
			}

			if(!preg_match('/(http[a-zA-Z0-9_\-\.\:\/\(\)\&\@\!\#\$]+\.(jpg|png))/i', $loadData[0]['content'], $matches))
			{
				throw new Exception('Post content not have any image.');
			}

			$image=$matches[1];

			$fileUrl=$image;

			File::create($savePath,$fileUrl);

		}

		return $fileUrl;
	}

	public static function getThumb($postid=0)
	{
		$theUri=$postid;

		$savePath=ROOT_PATH.'application/caches/images/'.$theUri.'.cache';

		$fileUrl='';

		if(file_exists($savePath))
		{
			$fileUrl=trim(file_get_contents($savePath));

		}
		else
		{

			$loadData=Post::get(array(
				'isHook'=>'no',
				'cache'=>'yes',
				'cacheTime'=>30,
				'where'=>"where postid='$postid'"
				));

			if(!isset($loadData[0]['image']))
			{
				throw new Exception('This post not exists.');
				
			}

			if(!file_exists(ROOT_PATH.$loadData[0]['image']))
			{
				throw new Exception('Thumbnail not exists.');
				
			}

			$fileUrl=$loadData[0]['image'];

			File::create($savePath,$fileUrl);

		}

		return $fileUrl;
	}

	public static function url($row)
	{
		$url=Url::post($row);

		return $url;
	}

	public static function api($action)
	{
		Model::load('api/post');

		try {
			$result=loadApi($action);
		} catch (Exception $e) {
			throw new Exception($e->getMessage());
		}

		return $result;
	}

	public static function upView($postid)
	{
		Database::query("update ".Database::getPrefix()."post set views=views+1 where postid='$postid'");
	}

	public static function downView($postid)
	{
		Database::query("update ".Database::getPrefix()."post set views=views-1 where postid='$postid'");
	}

	public static function insert($inputData=array())
	{
		// End addons
		// $totalArgs=count($inputData);

		$addMultiAgrs='';

		if(isset($inputData[0]['title']))
		{
		    foreach ($inputData as $theRow) {

		    	if(!isset($theRow['title']))
		    	{
		    		continue;
		    	}

				$theRow['date_added']=date('Y-m-d H:i:s');

				$postTitle=isset($theRow['addTitle'])?$theRow['addTitle']:$theRow['title'];

				$theRow['friendly_url']=String::makeFriendlyUrl(strip_tags($postTitle));

				
				$theRow['title']=String::encode(strip_tags($theRow['title']));


				if(isset($theRow['content']))
				{
					// $theRow['content']=Shortcode::toBBCode($theRow['content']);

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
			if(!isset($inputData['title']))
			{
				continue;
			}

			$inputData['date_added']=date('Y-m-d H:i:s');

			$postTitle=isset($inputData['addTitle'])?$inputData['addTitle']:$inputData['title'];

			$inputData['friendly_url']=String::makeFriendlyUrl(strip_tags($postTitle));

			
			$inputData['title']=String::encode(strip_tags($inputData['title']));

			if(isset($inputData['content']))
			{
				// $inputData['content']=Shortcode::toBBCode($inputData['content']);

				$inputData['content']=String::encode($inputData['content']);
			}

			$keyNames=array_keys($inputData);

			$insertKeys=implode(',', $keyNames);

			$keyValues=array_values($inputData);

			$insertValues="'".implode("','", $keyValues)."'";	

			$addMultiAgrs="($insertValues)";	
		}		

		Database::query("insert into ".Database::getPrefix()."post($insertKeys) values".$addMultiAgrs);

		// DBCache::removeDir('system/post');
		

		if(!$error=Database::hasError())
		{
			$id=Database::insert_id();

			return $id;	
		}

		return false;
	
	}

	public static function remove($post=array(),$whereQuery='',$addWhere='')
	{


		if(is_numeric($post))
		{
			$id=$post;

			unset($post);

			$post=array($id);
		}

		$total=count($post);

		$listID="'".implode("','",$post)."'";

		$whereQuery=isset($whereQuery[5])?$whereQuery:"postid in ($listID)";

		$addWhere=isset($addWhere[5])?$addWhere:"";

		$command="delete from ".Database::getPrefix()."post where $whereQuery $addWhere";

		Database::query($command);	

		// DBCache::removeDir('system/post');

		// DBCache::removeCache($listID,'system/post');

		return true;
	}

	public static function update($listID,$post=array(),$whereQuery='',$addWhere='')
	{

		if(is_numeric($listID))
		{
			$catid=$listID;

			unset($listID);

			$listID=array($catid);
		}

		$listIDs="'".implode("','",$listID)."'";	
				
		if(isset($post['title']))
		{
			$postTitle=isset($post['addTitle'])?$post['addTitle']:$post['title'];

			$post['title']=String::encode(strip_tags($post['title']));

			$post['friendly_url']=String::makeFriendlyUrl(strip_tags($postTitle));

			$loadPost=self::get(array(
				'where'=>"where friendly_url='".$post['friendly_url']."'"
				));

			if(isset($loadPost[0]['postid']) && (int)$loadPost[0]['postid']<>(int)$listID[0])
			{
				return false;
			}
		}		

		if(isset($post['content']))
		{
			// $post['content']=Shortcode::toBBCode($post['content']);

			$post['content']=String::encode($post['content']);

		}
	
				
		$keyNames=array_keys($post);

		$total=count($post);

		$setUpdates='';

		for($i=0;$i<$total;$i++)
		{
			$keyName=$keyNames[$i];
			$setUpdates.="$keyName='$post[$keyName]', ";
		}

		$setUpdates=substr($setUpdates,0,strlen($setUpdates)-2);
		
		$whereQuery=isset($whereQuery[5])?$whereQuery:"postid in ($listIDs)";
		
		$addWhere=isset($addWhere[5])?$addWhere:"";

		Database::query("update ".Database::getPrefix()."post set $setUpdates where $whereQuery $addWhere");

		// DBCache::removeDir('system/post');

		// DBCache::removeCache($listIDs,'system/post');


		if(!$error=Database::hasError())
		{
			return true;
		}

		return false;
	}


}
?>