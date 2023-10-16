<%-- 
    Document   : OrderDetail
    Created on : Oct 7, 2023, 7:30:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">
  .rows {
display: flex;
flex-wrap: wrap;
margin-right: -.100rem;
margin-left: -.75rem;
}
.scroll{
  height: 400px;
  overflow: scroll;
}
h4{
  font-weight: bold;
  color: red;
}
#top{
  padding-top: 9px;
}
</style>
 
<!-- /.container-fluid -->






<div class="container-fluid">
<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">BILL DETAILS 

    </h6>
     <form action="" method="POST">
           
  </div>

  <div class="card-body">

    <div class="table-responsive">

     <form action="" method="POST">
      <h4>PRODUCT ORDER</h4>
      
      
        </tbody>
      <div class="scroll">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            
            <th> Product name </th>
            <th> Image </th>
            <th> Size </th>
            <th> Quantity </th>
            <th> Price </th>
            <th> Total </th>
          </tr>
        </thead>
        <tbody>

          <tr>
            
            <td> Luffy </td>
            <td><img src="./resources/img/LuffyGear4.png" width="70" ></td> 
            <td> 400 x 400</td>
            <td> 1</td>
           
             <td>$100</td>
             <td>$100</td>
           </tr>

        </tbody>
      </table>
      </div>

       </form>

    </div>
      
  </div>

</div>

</div>

<script>
    $(document).ready(function(){
        $('#category').change(function(){
            var catName = $('#category option:selected').text();
            data = {
                category:1,
                catName:catName
            };
            $.ajax({
                url:"size.php",
                type:"POST",
                data:data
            }).done(function(result){
                $('#size').html(result);
                
            })
        })

    });
</script>
