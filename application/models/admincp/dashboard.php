<?php

function countStats()
{
	$resultData=array();

	$today=date('Y-m-d');

	$loadData=Post::get(array(
		'query'=>"select count(postid)as totalcount from ".Database::getPrefix()."post"
		));

	$resultData['post']['total']=$loadData[0]['totalcount'];
	
	$loadData=Post::get(array(
		'query'=>"select count(postid)as totalcount from ".Database::getPrefix()."post where DATE(date_added)='$today'"
		));

	$resultData['post']['today']=$loadData[0]['totalcount'];
	
	$loadData=Post::get(array(
		'query'=>"select count(postid)as totalcount from ".Database::getPrefix()."post where status='1'"
		));

	$resultData['post']['published']=$loadData[0]['totalcount'];
	
	$loadData=Post::get(array(
		'query'=>"select count(postid)as totalcount from ".Database::getPrefix()."post where status='0'"
		));

	$resultData['post']['pending']=$loadData[0]['totalcount'];

	$loadData=Comments::get(array(
		'query'=>"select count(commentid)as totalcount from ".Database::getPrefix()."comments"
		));

	$resultData['comments']['total']=$loadData[0]['totalcount'];

	$loadData=Comments::get(array(
		'query'=>"select count(commentid)as totalcount from ".Database::getPrefix()."comments where DATE(date_added)='$today'"
		));

	$resultData['comments']['today']=$loadData[0]['totalcount'];

	$loadData=Comments::get(array(
		'query'=>"select count(commentid)as totalcount from ".Database::getPrefix()."comments where status='1'"
		));

	$resultData['comments']['approved']=$loadData[0]['totalcount'];

	$loadData=Comments::get(array(
		'query'=>"select count(commentid)as totalcount from ".Database::getPrefix()."comments where status='0'"
		));

	$resultData['comments']['pending']=$loadData[0]['totalcount'];

	$loadData=Contactus::get(array(
		'query'=>"select count(contactid)as totalcount from ".Database::getPrefix()."contactus"
		));

	$resultData['contactus']['total']=$loadData[0]['totalcount'];

	$loadData=Contactus::get(array(
		'query'=>"select count(contactid)as totalcount from ".Database::getPrefix()."contactus where DATE(date_added)='$today'"
		));

	$resultData['contactus']['today']=$loadData[0]['totalcount'];

	$loadData=Users::get(array(
		'query'=>"select count(userid)as totalcount from ".Database::getPrefix()."users"
		));

	$resultData['users']['total']=$loadData[0]['totalcount'];

	$loadData=Users::get(array(
		'query'=>"select count(userid)as totalcount from ".Database::getPrefix()."users where DATE(date_added)='$today'"
		));

	$resultData['users']['today']=$loadData[0]['totalcount'];


	return $resultData;
}

?>