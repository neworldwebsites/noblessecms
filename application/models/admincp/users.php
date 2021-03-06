<?php

function actionProcess()
{
	$id=Request::get('id');

	if(!isset($id[0]))
	{
		return false;
	}

	$listID="'".implode("','", $id)."'";

	$action=Request::get('action');

	// die($action);

	switch ($action) {
		case 'delete':

			Users::remove($id);

			Address::remove($id);

			break;

		
	}
}

function insertProcess()
{
	$valid=Validator::make(array(
		'send.firstname'=>'min:1|slashes',
		'send.lastname'=>'min:1|slashes',
		'send.groupid'=>'number|slashes',
		'send.username'=>'min:3|slashes',
		'send.email'=>'email|slashes',
		'address.address_1'=>'slashes',
		'address.address_2'=>'slashes',
		'address.city'=>'slashes',
		'address.state'=>'slashes',
		'address.postcode'=>'slashes',
		'address.country'=>'slashes'

		));

	if(!$valid)
	{
		throw new Exception("Error Processing Request: ".Validator::getMessage());
		
	}

	$username=Request::get('send.username');

	$email=Request::get('send.email');

	$loadData=Users::get(array(
		'where'=>"where username='$username' OR email='$email'"
		));

	if(isset($loadData[0]['userid']))
	{
		throw new Exception("This user have been exist in database.");
		
	}

	$send=Request::get('send');

	$address=Request::get('address');
	
	$thepass=Request::get('thepass');

	$passMd5=String::encrypt($thepass);

	$send['password']=$passMd5;

	$address['firstname']=$send['firstname'];

	$address['lastname']=$send['lastname'];

	$userid=Users::insert($send);

	$address['userid']=$userid;

	Address::insert($address);
	
}
function updateProcess($id)
{
	$send=Request::get('send');

	$address=Request::get('address');


	$address['firstname']=$send['firstname'];

	$address['lastname']=$send['lastname'];

	Users::update($id,$send);

	Address::update($id,$address);
	
}


?>