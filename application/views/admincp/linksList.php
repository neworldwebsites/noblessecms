<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Links list</h3>
  </div>
  <div class="panel-body">
    <div class="row">
    	<div class="col-lg-8">
    	<form action="" method="post" enctype="multipart/form-data">
    		<!-- row -->
    		<div class="row">
    			<div class="col-lg-4">
                    <div class="input-group input-group-sm">
                        <select class="form-control" name="action">
                            <option value="delete">Delete</option>
                            <option value="ishomepage">Set is homepage</option>
                            
                        </select>
                       <span class="input-group-btn">
                        <button class="btn btn-primary" name="btnAction" type="submit">Apply</button>
                      </span>

                    </div><!-- /input-group -->   				
    			</div>
    			<div class="col-lg-4 col-lg-offset-4 text-right">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="txtKeywords" placeholder="Search..." />
                       <span class="input-group-btn">
                        <button class="btn btn-primary" name="btnSearch" type="submit">Search</button>
                      </span>

                    </div><!-- /input-group -->       				
    			</div>

    		</div>
    		<!-- row -->
     		<!-- row -->
    		<div class="row">
    			<div class="col-lg-12 table-responsive">
    				<table class="table table-hover">
    					<thead>
    						<tr>
    							<td class="col-lg-1"><input type="checkbox" id="selectAll" /></td>
                                <td class="col-lg-5">Title</td>
    							<td class="col-lg-2 text-right">Sort Order</td>
    							<td class="col-lg-2 text-right">Status</td>
    							<td class="col-lg-2 text-right">#</td>
    						</tr>
    					</thead>

    					<tbody>
    					<?php
    						$total=count($theList);

    						$li='';

    						if(isset($theList[0]['id']))
    						for ($i=0; $i < $total; $i++) { 
    							$li.='
	    						<!-- tr -->
	    						<tr>
	    							<td class="col-lg-1">
	    								<input type="checkbox" id="cboxID" name="id[]" value="'.$theList[$i]['id'].'" />
	    							</td>
	    							<td class="col-lg-5">'.$theList[$i]['title'].'</td>
                                    <td class="col-lg-2 text-right">'.$theList[$i]['sort_order'].'</td>
 	    							<td class="col-lg-2 text-right">'.ucfirst($theList[$i]['status']).'</td>

	    							<td class="col-lg-2 text-right">
	    							<a href="'.ADMINCP_URL.'links/edit/'.$theList[$i]['id'].'" class="btn btn-warning btn-xs">Edit</a>
	    							</td>
	    						</tr>    						
	    						<!-- tr -->
    							';
    						}

    						echo $li;
    					?>

    					</tbody>
    				</table>
    			</div>

				<div class="col-lg-12 text-right">
					<?php  echo $pages; ?>
				</div>    			
    		</div>
    		<!-- row -->
    	</form>
    	</div>
    	<div class="col-lg-4">
        

        <?php if(!Uri::has('\/edit\/\d+')){ ?>
    		<div class="divAddnew">
            <form action="" method="post" enctype="multipart/form-data"> 
            <?php echo $alert;?>
	     		<h4>Add new</h4>
                <p>
                    <label><strong>Title</strong></label>
                    <input type="text" class="form-control" name="send[title]" placeholder="Title" id="txtTitle" />
                </p>

                <p>
                    <label><strong>Url</strong></label>
                    <input type="text" class="form-control" name="send[url]" placeholder="Url" id="txtTitle" />
                </p>

                <p>
                    <label><strong>Parent</strong></label>
                    <select class="form-control" name="send[parentid]">
                        <option value="0">None</option>
                        <?php 
                        if(isset($listLinks[0]['id']))
                        {
                            $li='';

                            $total=count($listLinks);

                            for ($i=0; $i < $total; $i++) { 
                                $li.='<option value="'.$listLinks[$i]['id'].'">'.$listLinks[$i]['title'].'</option>';
                            }

                            echo $li;
                        }

                        ?>
                        
                    </select>
                </p>
                 
	    		<p>
	    			<button type="submit" class="btn btn-primary" name="btnAdd">Add new</button>
	    		</p>   	

                </form>		
    		</div>
            <?php }else{ ?>

    		<div class="divEdit">
            <form action="" method="post" enctype="multipart/form-data"> 
            <?php echo $alert;?>
	     		<h4>Edit</h4>
	    		<p>
	    			<label><strong>Title</strong></label>
	    			<input type="text" class="form-control" name="update[title]" value="<?php if(isset($edit['title']))echo $edit['title'];?>" placeholder="Title" id="txtTitle" />
	    		</p>
                <p>
                    <label><strong>Url</strong></label>
                    <input type="text" class="form-control" name="update[url]" value="<?php if(isset($edit['url']))echo $edit['url'];?>" placeholder="Url" id="txtTitle" />
                </p>
                 <p>
                    <label><strong>Sort Order</strong></label>
                    <input type="text" class="form-control" name="update[sort_order]" value="<?php if(isset($edit['sort_order']))echo $edit['sort_order'];?>" placeholder="Sort Order" id="txtSortOrder" />
                </p>
                 <p>
                    <label><strong>Parent</strong></label>
                    <select class="form-control" name="update[parentid]">
                        <option value="0">None</option>
                        <?php 
                        if(isset($listLinks[0]['id']))
                        {
                            $li='';

                            $total=count($listLinks);

                            for ($i=0; $i < $total; $i++) { 
                                $li.='<option value="'.$listLinks[$i]['id'].'">'.$listLinks[$i]['title'].'</option>';
                            }

                            echo $li;
                        }

                        ?>
                        
                    </select>
                </p>
	    		<p>
	    			<button type="submit" class="btn btn-primary" name="btnSave">Save changes</button>
	    		</p>   		
                </form> 	
    		</div>
            <?php } ?>
        
    	</div>
    	
    </div>
  </div>
</div>

