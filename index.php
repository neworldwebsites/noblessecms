<?php
ob_start();
session_start();
error_reporting(0);

// Check install or not
if(file_exists('install/index.php'))
{
	header("Location: install/");
}

define("SERVER_URL", 'http://noblessecms.com/');

define("SYSTEM_VERSION", '2.0');

define("ADMINCP_TITLE", 'Cpanel Noblesse CMS');

define("PREFIX", '');

require('./config.php');

require(ROOT_PATH . 'routes.php');

/* Codeme PHP Framework v2.0 - Write & Develop by [Minh Tien] - Email: safeservicejt@gmail.com
 * You will create & define route here. Route will check then load controller which you create.
 *
 *
 *
 */
?>