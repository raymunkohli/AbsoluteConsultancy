<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment form</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="resources/tablecss.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/payment_form/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/payment_form/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (Rectangle) -->
      <div id="u400" class="ax_default box_1">
        <div id="u400_div" class=""></div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u401" class="ax_default label">
        <div id="u401_div" class=""></div>
        <div id="u401_text" class="text ">
          <p><span>Select customer</span></p>
        </div>
      </div>

      <!-- Unnamed (Table) -->
      <div id="u402" class="ax_default">
          <table>
              <tr>
                  <th> Job ID</th>
                  <th> Price (inc Discount) </th>
                  <th> Order Date </th>
                  <th> DeadLine </th>
              </tr>
              <c:forEach items="${Jobs}" var="Jobs">
                  <tr>
                  <td> <c:out value="${Jobs.jobID}" /> </td>
                  <td> <c:out value="${Jobs.value}" /> </td>
                  <td> <c:out value="${Jobs.orderDate}" /> </td>
                  <td> <c:out value="${Jobs.deadline}" /> </td>
                  
                  </tr>
              </c:forEach>
          </table>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u424" class="ax_default label">
        <div id="u424_div" class=""></div>
        <div id="u424_text" class="text ">
          <p><span>Choose a payment type</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u425" class="ax_default label">
        <div id="u425_div" class=""></div>
        <div id="u425_text" class="text ">
          <p><span>Date</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u426" class="ax_default label">
        <div id="u426_div" class=""></div>
        <div id="u426_text" class="text ">
          <p><span>Type</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u427" class="ax_default label">
        <div id="u427_div" class=""></div>
        <div id="u427_text" class="text ">
          <p><span>Expiry date </span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u428" class="ax_default label">
        <div id="u428_div" class=""></div>
        <div id="u428_text" class="text ">
          <p><span>Last 4 digits</span></p>
        </div>
      </div>

      <!-- Unnamed (Droplist) -->
      <div id="u429" class="ax_default droplist">
        <select id="u429_input">
          <option selected value="Mastercard">Mastercard</option>
        </select>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u430" class="ax_default text_field">
        <input id="u430_input" type="text" value=""/>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u431" class="ax_default" data-left="593" data-top="352" data-width="120" data-height="21">

        <!-- Unnamed (Text Field) -->
        <div id="u432" class="ax_default text_field">
          <input id="u432_input" type="text" value="02/08/2018"/>
        </div>

        <!-- Unnamed (Shape) -->
        <div id="u433" class="ax_default icon">
          <img id="u433_img" class="img " src="images/shift_manager_screen/u202.png"/>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u434" class="ax_default" data-left="593" data-top="452" data-width="120" data-height="21">

        <!-- Unnamed (Text Field) -->
        <div id="u435" class="ax_default text_field">
          <input id="u435_input" type="text" value="09/23"/>
        </div>

        <!-- Unnamed (Shape) -->
        <div id="u436" class="ax_default icon">
          <img id="u436_img" class="img " src="images/shift_manager_screen/u202.png"/>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u437" class="ax_default label">
        <div id="u437_div" class=""></div>
        <div id="u437_text" class="text ">
          <p><span>Date</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u438" class="ax_default label">
        <div id="u438_div" class=""></div>
        <div id="u438_text" class="text ">
          <p><span>Currency</span></p>
        </div>
      </div>

      <!-- Unnamed (Vertical Line) -->
      <div id="u439" class="ax_default line">
        <img id="u439_img" class="img " src="images/payment_form/u439.png"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u440" class="ax_default button">
        <div id="u440_div" class=""></div>
        <div id="u440_text" class="text ">
          <p><span>Add card pay</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u441" class="ax_default button">
        <div id="u441_div" class=""></div>
        <div id="u441_text" class="text ">
          <p><span>Add cash pay</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Area) -->
      <div id="u442" class="ax_default text_area">
        <textarea id="u442_input"></textarea>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u443" class="ax_default label">
        <div id="u443_div" class=""></div>
        <div id="u443_text" class="text ">
          <p><span>Signature</span></p>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u444" class="ax_default" data-left="153" data-top="355" data-width="120" data-height="21">

        <!-- Unnamed (Text Field) -->
        <div id="u445" class="ax_default text_field">
          <input id="u445_input" type="text" value="02/08/2018"/>
        </div>

        <!-- Unnamed (Shape) -->
        <div id="u446" class="ax_default icon">
          <img id="u446_img" class="img " src="images/shift_manager_screen/u202.png"/>
        </div>
      </div>

      <!-- Unnamed (Droplist) -->
      <div id="u447" class="ax_default droplist">
        <select id="u447_input">
          <option selected value="GBP">GBP</option>
        </select>
      </div>

      <!-- Unnamed (Table) -->
      <div id="u448" class="ax_default">

        <!-- Unnamed (Table Cell) -->
        <div id="u449" class="ax_default table_cell">
          <img id="u449_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u449_text" class="text ">
            <p><span>ID</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u450" class="ax_default table_cell">
          <img id="u450_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u450_text" class="text ">
            <p><span>Name</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u451" class="ax_default table_cell">
          <img id="u451_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u451_text" class="text ">
            <p><span>Amount</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u452" class="ax_default table_cell">
          <img id="u452_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u452_text" class="text ">
            <p><span>Method</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u453" class="ax_default table_cell">
          <img id="u453_img" class="img " src="images/payment_form/u453.png"/>
          <div id="u453_text" class="text ">
            <p><span>Job ID(s)</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u454" class="ax_default table_cell">
          <img id="u454_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u454_text" class="text ">
            <p><span>23</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u455" class="ax_default table_cell">
          <img id="u455_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u455_text" class="text ">
            <p><span>Ali Bowns</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u456" class="ax_default table_cell">
          <img id="u456_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u456_text" class="text ">
            <p><span>£420.00</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u457" class="ax_default table_cell">
          <img id="u457_img" class="img " src="images/payment_form/u449.png"/>
          <div id="u457_text" class="text ">
            <p><span>Cash</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u458" class="ax_default table_cell">
          <img id="u458_img" class="img " src="images/payment_form/u453.png"/>
          <div id="u458_text" class="text ">
            <p><span>[2] [43] [32]</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u459" class="ax_default table_cell">
          <img id="u459_img" class="img " src="images/customers_form/u319.png"/>
          <div id="u459_text" class="text ">
            <p><span>17</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u460" class="ax_default table_cell">
          <img id="u460_img" class="img " src="images/customers_form/u319.png"/>
          <div id="u460_text" class="text ">
            <p><span>City University</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u461" class="ax_default table_cell">
          <img id="u461_img" class="img " src="images/customers_form/u319.png"/>
          <div id="u461_text" class="text ">
            <p><span>£120.00</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u462" class="ax_default table_cell">
          <img id="u462_img" class="img " src="images/customers_form/u319.png"/>
          <div id="u462_text" class="text ">
            <p><span>Card</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u463" class="ax_default table_cell">
          <img id="u463_img" class="img " src="images/payment_form/u463.png"/>
          <div id="u463_text" class="text ">
            <p><span>[8]</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u464" class="ax_default table_cell">
          <img id="u464_img" class="img " src="images/customers_form/u340.png"/>
          <div id="u464_text" class="text ">
            <p><span>Etc</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u465" class="ax_default table_cell">
          <img id="u465_img" class="img " src="images/customers_form/u340.png"/>
          <div id="u465_text" class="text ">
            <p><span>Etc</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u466" class="ax_default table_cell">
          <img id="u466_img" class="img " src="images/customers_form/u340.png"/>
          <div id="u466_text" class="text ">
            <p><span>Etc</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u467" class="ax_default table_cell">
          <img id="u467_img" class="img " src="images/customers_form/u340.png"/>
          <div id="u467_text" class="text ">
            <p><span>Etc</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u468" class="ax_default table_cell">
          <img id="u468_img" class="img " src="images/payment_form/u468.png"/>
          <div id="u468_text" class="text ">
            <p><span>Etc</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u469" class="ax_default label">
        <div id="u469_div" class=""></div>
        <div id="u469_text" class="text ">
          <p><span style="text-decoration:underline;">Payment history</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u470" class="ax_default label">
        <div id="u470_div" class=""></div>
        <div id="u470_text" class="text ">
          <p><span>Price: £XXX.XX</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u471" class="ax_default label">
        <div id="u471_div" class=""></div>
        <div id="u471_text" class="text ">
          <p><span>Add a payment</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u472" class="ax_default line">
        <img id="u472_img" class="img " src="images/receptionist_screen/u84.png"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u473" class="ax_default label">
        <div id="u473_div" class=""></div>
        <div id="u473_text" class="text ">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u474" class="ax_default label">
        <div id="u474_div" class=""></div>
        <div id="u474_text" class="text ">
          <p><span>Discount: Fixed</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u475" class="ax_default button">
        <div id="u475_div" class=""></div>
        <div id="u475_text" class="text ">
            <p><span><form action="viewPaymentCust" method="post">
                        <input type="submit" value="View customer list"/>
                    </form></span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u476" class="ax_default label">
        <div id="u476_div" class=""></div>
        <div id="u476_text" class="text ">
          <p><span>Price after discount: £XXX.XX</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u477" class="ax_default icon">
        <img id="u477_img" class="img " src="images/receptionist_screen/u88.png"/>
      </div>
    </div>
  </body>
</html>
