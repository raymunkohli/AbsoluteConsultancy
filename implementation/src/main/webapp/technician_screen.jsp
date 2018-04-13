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
        <link href="resources/tablecss" type="text/css" rel="stylesheet"
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

            <!-- Unnamed (Rectangle) -->
            <div id="u143" class="ax_default box_1">
                <div id="u143_div" class=""></div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u144" class="ax_default box_2">
                <div id="u144_div" class=""></div>
            </div>

            <!-- Unnamed (Rectangle) -->
            <div id="u145" class="ax_default label">
                <div id="u145_div" class=""></div>
                <div id="u145_text" class="text ">
                    <p><span>Select job</span></p>
                </div>
            </div>

            <!-- Unnamed (Table) -->
            <div id='u146' class="ax_default">

                <style>
                    tr{cursor: pointer; transition: all .25s ease-in-out}
                    .selected{background-color: #cccccc; color: #fff;}
                </style>

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
                            <td> ${Customer[Status.index].holder} </td>
                            <td> ${Customer.name} </td>
                            <td> ${Basetask.description} </td>
                            <td> ${Basetask.department} </td>
                            <th> ${Jobs.deadline} </th>
                            <td> <input type="checkbox" value="${Jobs.jobID}`${Customer.holder}`
                                        ${Customer.name}`${Base.description}`${Base.department}`
                                        ${Base.description}`${Jobs.deadline}" name="${Jobs.jobID}"/> </td>
                            
                        </tr>
                    </c:forEach>
                    
                    
                    <!--
                    <c:forEach items="${Jobs}" var="Jobs" varStatus="Status">
                        <tr>
                            <td> ${Jobs.jobID} </td>
                            <td> city </td>
                            <td> ${Customer.name} </td>
                            <td> ${Basetask.department} </td>
                            <td> ${Jobs.deadline} </td>
                        <form method="post" action="selectedJobTechician">
                            <input type="hidden" value="${Tasks[Status.index].taskID}"/> 
                            <td> <input type="Submit" value="Select"/> </td>
                        </form>
                        </tr>
                    </c:forEach> 
                    -->
                </table>

                <script>
                    function selectedRow() {
                        var index,
                                table = document.getElementById("table");
                        for (var i = 1; i < table.rows.length; i++)
                        {
                            table.rows[i].onclick = function ()
                            {
                                if (typeof index !== "undefined") {
                                    table.rows[index].classList.toggle("selected");
                                }
                                document.getElementById("jID").value = this.cells[0].innerHTML;
                                console.log(typeof index);
                                // get the selected row index
                                index = this.rowIndex;
                                // add class selected to the row
                                this.classList.toggle("selected");
                                console.log(typeof index);
                            };
                        }
                    }
                    selectedRow();
                </script>
            </div>


            <!-- Unnamed (Rectangle) -->
            <div id="u162" class="ax_default label">
                <div id="u162_div" class=""></div>
                <div id="u162_text" class="text ">
                    Selected job:<output name="jID" id="jID"><br><br>
                        </div>
                        </div>

                        <!-- Unnamed (Text Field) -->
                        <div id="u163" class="ax_default text_field">
                            <input id="u163_input" type="text" value="Use of small copy camera"/>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u164" class="ax_default paragraph">
                            <div id="u164_div" class=""></div>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u165" class="ax_default button">
                            <!-- <div id="u165_div" class=""></div> -->
                            <div id="u165_text" class="text ">
                                <p><span><input type="submit" value="Update Task" form="" style="height: 50px; width: 135px" /></span></p>
                            </div>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u166" class="ax_default label">
                            <div id="u166_div" class=""></div>
                            <div id="u166_text" class="text ">
                                <p><span>Current task:</span></p>
                            </div>
                        </div>

                        <!-- Unnamed (Rectangle) -->
                        <div id="u167" class="ax_default label">
                            <div id="u167_div" class=""></div>
                            <div id="u167_text" class="text ">
                                <p><span>Performed by: Alan</span></p>
                            </div>
                        </div>

                        <!-- Unnamed (Group) -->
                        <div id="u168" class="ax_default" data-left="78" data-top="441" data-width="247" data-height="220">

                            <!-- Unnamed (Text Area) -->
                            <div id="u169" class="ax_default text_area">
                                <textarea id="u169_input">From: Jay

Alan have you completed task 6 for job 34?
Let me know ASAP, customer is ready to collect!

Thanks.</textarea>
                            </div>

                            <!-- Unnamed (Rectangle) -->
                            <div id="u170" class="ax_default label">
                                <div id="u170_div" class=""></div>
                                <div id="u170_text" class="text ">
                                    <p><span style="text-decoration:underline;">Enquiry box</span></p>
                                </div>
                            </div>

                            <!-- Unnamed (Rectangle)--> 
                            <div id="u171" class="ax_default label">
                                <div id="u171_div" class=""></div>
                                <div id="u171_text" class="text ">
                                    <p><span>Shelf:</span></p>
                                </div>
                            </div>
                            
                            <!-- Unnamed (Text Field) -->
                            <div id="u172" class="ax_default text_field">
                                <input id="u172_input" type="text" value=""/>
                            </div>
                           

                            <!-- Unnamed (Rectangle) -->
                            <div id="u173" class="ax_default button">
                                <!-- <div id="u173_div" class=""></div> -->
                                <div id="u173_text" class="text ">
                                    <p><span><input type="submit" value="Notify deadline exceed" form="" style="height: 50px; width: 135px" /></span></p>
                                </div>
                            </div>

                            <!-- Unnamed (Shape) -->
                            <div id="u174" class="ax_default icon">
                                <img id="u174_img" class="img " src="images/technician_screen/u174.png"/>
                            </div>

                            <!-- Unnamed (Shape) -->
                            <div id="u175" class="ax_default icon">
                                <img id="u175_img" class="img " src="images/technician_screen/u175.png"/>
                            </div>


                            <!--
                            <div id="u175" class="ax_default icon">
                              <button type="submit">
                                  <img src="images/technician_screen/u175.png" onmouseover="this.src='images/technician_screen/u175.png';" onmouseout="this.src='images/technician_screen/u175.png';" />
                              </button>
                            </div>
                            -->


                            <!-- Unnamed (Rectangle) -->
                            <div id="u176" class="ax_default label">
                                <div id="u176_div" class=""></div>
                                <div id="u176_text" class="text ">
                                    <p><span>Previous Enquiry</span></p>
                                </div>
                            </div>

                            <!-- Unnamed (Rectangle) -->
                            <div id="u177" class="ax_default label">
                                <div id="u177_div" class=""></div>
                                <div id="u177_text" class="text ">
                                    <p><span>Next Enquiry</span></p>
                                </div>
                            </div>

                            <!-- Unnamed (Rectangle) -->
                            <div id="u178" class="ax_default paragraph">
                                <div id="u178_div" class=""></div>
                                <div id="u178_text" class="text ">
                                    <p><span>To: Jay</span></p><p><span><br></span></p><p><span>Deadline is going to exceed for job 34. There is still 1 task left. I have notified both managers.</span></p><p><span><br></span></p><p><span>Thanks</span></p>
                                </div>
                            </div>

                            <!-- Unnamed (Rectangle) -->
                            <div id="u179" class="ax_default button">
                                <!-- <div id="u179_div" class=""></div> -->
                                <div id="u179_text" class="text ">
                                    <p><span><input type="submit" value="Respond" form="" style="height: 50px; width: 135px" /></span></p>
                                </div>
                            </div>


                            <!-- Unnamed (Shape) 
                            <div id="u180" class="ax_default icon">
                                <img id="u180_img" class="img " src="images/technician_screen/u175.png"/>
                            </div>
            
                            <!-- Unnamed (Shape) 
                            <div id="u181" class="ax_default icon">
                                <img id="u181_img" class="img " src="images/technician_screen/u174.png"/>
                            </div>
                            -->


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

                            <!-- Unnamed (Shape)
                            <div id="u184" class="ax_default icon">
                                <img id="u184_img" class="img " src="images/technician_screen/u184.png"/>
                            </div>
                            -->

                            <!-- Unnamed (Shape)-->
                            <div id="u185" class="ax_default icon">
                                <img id="u185_img" class="img " src="images/receptionist_screen/u88.png"/>
                            </div>
                        </div>
                        </body>
                        </html>
