<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Technician screen</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
        <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
        <link href="data/styles.css" type="text/css" rel="stylesheet"/>
        <link href="files/technician_screen/styles.css" type="text/css" rel="stylesheet"/>
        <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
        <script src="resources/scripts/jquery-1.7.1.min.js"></script>
        <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
        <script src="resources/scripts/prototypePre.js"></script>
        <script src="data/document.js"></script>
        <script src="resources/scripts/prototypePost.js"></script>
        <script src="files/technician_screen/data.js"></script>
        <script type="text/javascript">
            $axure.utils.getTransparentGifPath = function () {
                return 'resources/images/transparent.gif';
            };
            $axure.utils.getOtherPath = function () {
                return 'resources/Other.html';
            };
            $axure.utils.getReloadPath = function () {
                return 'resources/reload.html';
            };
        </script>
    </head>
    <body>
        <div id="base" class="">
            <!-- Unnamed (Horizontal Line) -->
            <div id="u182" class="ax_default line">
                <img id="u182_img" class="img " src="images/receptionist_screen/u84.png"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u183" class="ax_default label">
                <div id="u183_div" class=""></div>
                <div id="u183_text" class="text ">
                    <p><span>Technician</span></p>
                </div>
            </div>
            <c:if test="${id == null}" >

                <!-- Unnamed (Rectangle) -->
                <div id="u145" class="ax_default label">
                    <div id="u145_div" class=""></div>
                    <div id="u145_text" class="text ">
                        <p><span>Select job</span></p>
                    </div>
                </div>

                <!-- Unnamed (Table) -->
                <div id='u146' class="ax_default">

                    <table id="table" border="1" width="670px">
                        <tr>
                            <th> ID </th>
                            <th> Holder</th>
                            <th> Customer </th>
                            <th> Status </th>
                            <th> Department </th>
                            <th> Deadline </th>
                            <th> Select </th>
                        </tr>

                        <c:forEach items="${Jobs}" var="Jobs" varStatus="Status">
                            <tr>
                                <td> ${Jobs.jobID} </td>
                                <td> ${Customers[Status.index].holder} </td>
                                <td> ${Customers[Status.index].name} ${Customers[Status.index].surname}</td>
                                <td> ${Basetasks[Status.index].description} </td>
                                <td> ${Basetasks[Status.index].department} </td>
                                <td> ${Jobs.deadline} </td>
                                <td> <form action="selectedJobTechician" method="post">
                                        <input type="hidden" value="${Basetasks[Status.index].description}" name="desc"/> 
                                        <input type="hidden" value="${Tasks[Status.index].taskID}" name="id"/>
                                        <input type="hidden" value="${Jobs.jobID}" name ="job"/>
                                        <input type="submit" value="Select"></td> 
                                    </form>
                            </tr>
                        </c:forEach>  
                    </table>
                </div>
            </c:if>



            <c:if test="${id != null}" >
                <!-- Unnamed (Rectangle) -->
                <div id="u162" class="ax_default label">
                    <div id="u162_div" class=""></div>
                    <div id="u162_text" class="text ">
                        <p>Selected job: ${job}</p>
                        <p>${Err} </p>
                    </div>
                </div>
                <!-- Unnamed (Rectangle) -->
                <div id="u164" class="ax_default paragraph">
                    <div id="u164_div" class=""></div>
                </div>

                <form action="taskCompleted" method="post">
                    <input type="hidden" value="${job}" name="job">
                    <!-- Unnamed (Text Field) -->
                    <div id="u172" class="ax_default text_field">
                        <input type="text" name="shelf" requried=""/>
                    </div>
                    <input type="hidden" value="${id}" name="id" >
                    <!-- Unnamed (Rectangle) -->
                    <div id="u166" class="ax_default label">
                        <div id="u166_div" class=""></div>
                        <div id="u166_text" class="text ">
                            <p><span>Current task: ${desc}</span></p>
                        </div>
                    </div>
                        <input type="hidden" value="${desc}" name="id" >
                    <!-- Unnamed (Rectangle)--> 
                    <div id="u171" class="ax_default label">
                        <div id="u171_div" class=""></div>
                        <div id="u171_text" class="text ">
                            <p><span>Shelf:</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Rectangle) -->
                    <div id="u165" class="ax_default button">
                        <div id="u165_div" class=""></div>
                        <div id="u165_text" class="text ">
                            <p><span><input type="submit" value="Task Finished"/></span></p>
                        </div>
                    </div>
                </form>

            </c:if>


        </div>
    </body>
</html>
