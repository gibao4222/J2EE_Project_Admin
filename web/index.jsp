<%-- 
    Document   : indexx
    Created on : Oct 27, 2023, 9:25:59 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    
        <%@include file ="component/navbar.jsp" %>
        
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Doanh thu</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${total} đ</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Nhập Hàng</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalImport}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tồn kho
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Khách Hàng</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${quantityCus}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Khách Hàng Thân Thiết</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> ${top5Cus.get(0)[1]}
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> ${top5Cus.get(1)[1]}
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ${top5Cus.get(2)[1]}
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-danger"></i> ${top5Cus.get(3)[1]}
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> ${top5Cus.get(4)[1]}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-7 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">Server Migration <span
                                            class="float-right">20%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Sales Tracking <span
                                            class="float-right">40%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Customer Database <span
                                            class="float-right">60%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 60%"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Payout Details <span
                                            class="float-right">80%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Account Setup <span
                                            class="float-right">Complete!</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Color System -->
                            <div class="row">
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-primary text-white shadow">
                                        <div class="card-body">
                                            Primary
                                            <div class="text-white-50 small">#4e73df</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-success text-white shadow">
                                        <div class="card-body">
                                            Success
                                            <div class="text-white-50 small">#1cc88a</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-info text-white shadow">
                                        <div class="card-body">
                                            Info
                                            <div class="text-white-50 small">#36b9cc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-warning text-white shadow">
                                        <div class="card-body">
                                            Warning
                                            <div class="text-white-50 small">#f6c23e</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-danger text-white shadow">
                                        <div class="card-body">
                                            Danger
                                            <div class="text-white-50 small">#e74a3b</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-secondary text-white shadow">
                                        <div class="card-body">
                                            Secondary
                                            <div class="text-white-50 small">#858796</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-light text-black shadow">
                                        <div class="card-body">
                                            Light
                                            <div class="text-black-50 small">#f8f9fc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mb-4">
                                    <div class="card bg-dark text-white shadow">
                                        <div class="card-body">
                                            Dark
                                            <div class="text-white-50 small">#5a5c69</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-5 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Sản phẩm được yêu thích</h6>
                                </div>
                                <div class="card-body">
<!--                                    <div class="mb-4">
                                        
                                        <h6 class="text-sm font-weight-bold ml-4"> <div class="mr-5"></div>  <span class="ml-4">Tên sản phẩm</span> <span class="ml-5">Số lượt bán</span> <span class="float-right">Tổng tiền</span></h6>
                                    </div>
                                    <div class="mb-4">
                                        
                                        <h6 class="text-sm font-weight-bold ml-4"> <img src="resources/img/top1.png" alt="alt" class="mr-4"/>  ${top10Pro.get(0)[1]} <span class="ml-5">${top10Pro.get(0)[2]}</span> <span class="float-right">${top10Pro.get(0)[3]}</span></h6>
                                    </div>
                                    
                                <div class="mb-4">
                                    <h6 class="text-sm font-weight-bold ml-4"> <img src="resources/img/top2.png" alt="alt" class="mr-4"/>  ${top10Pro.get(1)[1]} <span class="ml-5">${top10Pro.get(1)[2]}</span> <span class="float-right">${top10Pro.get(1)[3]}</span></h6>
                                </div>
                                    
                                    <div class="mb-4">
                                        <h6 class="text-sm font-weight-bold ml-4"> <img src="resources/img/top3.png" alt="alt" class="mr-4"/>  ${top10Pro.get(2)[1]} <span class="ml-5">${top10Pro.get(2)[2]}</span> <span class="float-right">${top10Pro.get(2)[3]}</span></h6>
                                </div>
                                
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    -->
                                    <div class="table-responsive table">
    <table class="table table-borderless">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Tên SP</th>
                <th scope="col">Lượt Bán</th>
                <th scope="col">Tổng Tiền</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row"><img src="resources/img/top1.png" alt="alt"/></th>
                <td>${top10Pro.get(0)[1]}</td>
                <td>${top10Pro.get(0)[2]}</td>
                <td>${top10Pro.get(0)[3]} đ</td>
            </tr>
            <tr>
                <th scope="row"><img src="resources/img/top2.png" alt="alt"/></th>
                <td>${top10Pro.get(1)[1]}</td>
                <td>${top10Pro.get(1)[2]}</td>
                <td>${top10Pro.get(1)[3]} đ</td>
            </tr>
            <tr>
                <th scope="row"><img src="resources/img/top3.png" alt="alt"/></th>
                <td>${top10Pro.get(2)[1]}</td>
                <td>${top10Pro.get(2)[2]}</td>
                <td>${top10Pro.get(2)[3]} đ</td>
            </tr>
            <c:forEach items="${top10Pro}" var="c" begin="3" varStatus="loopStatus">
                <tr>
                    <th scope="row"><span class="ml-2">${loopStatus.index+1}</span></th>
                <td>${c[1]}</td>
                <td>${c[2]}</td>
                <td>${c[3]} đ</td>
                </tr>
            </c:forEach>
            <!-- Các dòng khác -->
        </tbody>
    </table>
</div>
                                </div>

                            <!-- Approach -->
<!--                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                                </div>
                                <div class="card-body">
                                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                        CSS bloat and poor page performance. Custom CSS classes are used to create
                                        custom components and custom utility classes.</p>
                                    <p class="mb-0">Before working with this theme, you should become familiar with the
                                        Bootstrap framework, especially the utility classes.</p>
                                </div>
                            </div>-->

                        </div>
                    </div>

                </div>
                                
                <!-- /.container-fluid -->
                <!-- Page level plugins -->
    <script src="./resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <!--<script src="./resources/js/demo/chart-area-demo.js"></script>-->
    <!--<script src="./resources/js/demo/chart-pie-demo.js"></script>-->
                <script>
                    var initialLabel =[];
                    var initialData = [];
                    
                    $.ajax({
                        url: "/J2EE_Project_Admin/home",
                        type: 'POST',
                        dataType: "json",
                        success: function (data) {
                             try {
                                var jsonData = data;
    
                                 // Duyệt qua từng cặp key-value trong đối tượng JSON
        var sortedKeys = Object.keys(jsonData).sort(); // Sắp xếp các key (tháng) tăng dần
        for (var i = 0; i < sortedKeys.length; i++) {
            var key = sortedKeys[i];
            var amount = jsonData[key];

            // Lưu giá trị tháng vào mảng initialLabel
            initialLabel.push(key);

            // Chuyển đổi giá trị tiền thành số và lưu vào mảng initialData
            var numericAmount = parseFloat(amount.replace(/,/g, ''));
            initialData.push(numericAmount);
        }
                            } catch (error) {
                                console.error("Lỗi phân tích JSON:", error);
                            }
                        },
                        error: function (xhr) {
                        
                            console.error("Lỗi khi gửi yêu cầu đến Servlet:", xhr);
                        }
                    });          
    // Điều này là dữ liệu mẫu ban đầu, bạn có thể thay đổi nó theo yêu cầu của mình.
    

    // Lấy tham chiếu đến canvas và khởi tạo biểu đồ
    var ctx = document.getElementById('myAreaChart').getContext('2d');
    var myAreaChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: initialLabel,
            datasets: [{
                label: 'Earnings Overview',
                data: initialData, // Dữ liệu mẫu ban đầu
                backgroundColor: 'rgba(78, 115, 223, 0.05)',
                borderColor: 'rgba(78, 115, 223, 1)',
                pointRadius: 3,
                pointBackgroundColor: 'rgba(78, 115, 223, 1)',
                pointBorderColor: 'rgba(78, 115, 223, 1)',
                pointHoverRadius: 3,
                pointHoverBackgroundColor: 'rgba(78, 115, 223, 1)',
                pointHoverBorderColor: 'rgba(78, 115, 223, 1)',
                pointHitRadius: 10,
                pointBorderWidth: 2,
            }]
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        maxTicksLimit: 5,
                        padding: 10,
                        callback: function (value, index, values) {
                            return '$' + number_format(value);
                        }
                    },
                    gridLines: {
                        color: 'rgb(234, 236, 244)',
                        zeroLineColor: 'rgb(234, 236, 244)',
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }]
            },
            legend: {
                display: false
            },
            tooltips: {
                backgroundColor: 'rgb(255,255,255)',
                bodyFontColor: '#858796',
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: 'index',
                caretPadding: 10,
                callbacks: {
                    label: function (tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': ' + number_format(tooltipItem.yLabel)+' đ';
                    }
                }
            }
        }
    });

    // Hàm cập nhật dữ liệu của biểu đồ
    function updateChartData(newData) {
        myAreaChart.data.datasets[0].data = newData;
        myAreaChart.update();
    }

    // Hàm định dạng số thành chuỗi có dấu phẩy ngăn cách hàng nghìn
    function number_format(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    
    // Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["${top5Cus.get(0)[1]}", "${top5Cus.get(1)[1]}", "${top5Cus.get(2)[1]}","${top5Cus.get(3)[1]}","${top5Cus.get(4)[1]}"],
    datasets: [{
      data: [${top5Cus.get(0)[2]}, ${top5Cus.get(1)[2]}, ${top5Cus.get(2)[2]} ,${top5Cus.get(3)[2]} ,${top5Cus.get(4)[2]}],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#F84D94','#F9E15F'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf','#CD3977','#EACD35'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

    
    
    
                </script>
            
<%@include file="component/footer.jsp" %>
    