<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Shift manager screen</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/shift_manager_screen/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/shift_manager_screen/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (Rectangle) -->
      <div id="u186" class="ax_default box_1">
        <div id="u186_div" class=""></div>
      </div>

      <!-- Unnamed (Group) -->
      <% if(session.getAttribute("userType")!=null && session.getAttribute("userType").equals("shiftmanager")){ %>
      <%@include  file="shiftBar.jsp" %>
      <% } %>
      <!-- Unnamed (Rectangle) -->
      <form action="generatePerformanceReportServlet" method="post" name="performace" id="performance">
      <div id="u191" class="ax_default label">
        <div id="u191_div" class=""></div>
        <div id="u191_text" class="text ">
          <p><span>Performance report</span></p>
        </div>
      </div>
        <div id="u191" style="left:500px" class="ax_default label">
            <div id="u191_text" class="text ">
                <font color="red"> ${perErr} </font>
            </div>
        </div>
    

      <!-- Unnamed (Checkbox) -->
      <div id="u192" class="ax_default checkbox">
        <label for="u192_input" style="position: absolute;">
          <div id="u192_text" class="text ">
            <p><span>Day shift</span></p>
          </div>
        </label>
        <input id="u192_input" type="checkbox" name="dayShift"/>
      </div>

      <!-- Unnamed (Checkbox) -->
      <div id="u193" class="ax_default checkbox">
        <label for="u193_input" style="position: absolute;">
          <div id="u193_text" class="text ">
            <p><span>Night shift</span></p>
          </div>
        </label>
        <input id="u193_input" type="checkbox"  name="nightShift"/>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u194" class="ax_default" data-left="31" data-top="213" data-width="170" data-height="24">

        <!-- Unnamed (Group) -->
        <div id="u195" class="ax_default" data-left="78" data-top="213" data-width="123" data-height="21">

          <!-- Unnamed (Text Field) -->
          <div id="u196" class="ax_default text_field">
            <input id="u196_input" type="date" name="fromDate" required/>
          </div>

          <!-- Unnamed (Shape) -->
        </div>

        <!-- Unnamed (Rectangle) -->
        <div id="u198" class="ax_default label">
          <div id="u198_div" class=""></div>
          <div id="u198_text" class="text ">
            <p><span>From</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u199" class="ax_default" data-left="336" data-top="213" data-width="144" data-height="24">

        <!-- Unnamed (Group) -->
        <div id="u200" class="ax_default" data-left="360" data-top="213" data-width="120" data-height="21">

          <!-- Unnamed (Text Field) -->
          <div id="u201" class="ax_default text_field">
            <input id="u201_input" type="Date" value="toDate" required>
          </div>

          <!-- Unnamed (Shape) -->

        </div>

        <!-- Unnamed (Rectangle) -->
        <div id="u203" class="ax_default label">
          <div id="u203_div" class=""></div>
          <div id="u203_text" class="text ">
            <p><span>To</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u204" class="ax_default" data-left="31" data-top="368" data-width="579" data-height="22">

        <!-- Unnamed (Radio Button) -->
        <div id="u205" class="ax_default radio_button">
          <label for="u205_input" style="position: absolute;">
            <div id="u205_text" class="text ">
              <p><span>Copy room</span></p>
            </div>
          </label>
            <input id="u205_input" type="checkbox" value="radio" name="CopyRoom" />
        </div>

        <!-- Unnamed (Radio Button) -->
        <div id="u206" class="ax_default radio_button">
          <label for="u206_input" style="position: absolute;">
            <div id="u206_text" class="text ">
              <p><span>Development</span></p>
            </div>
          </label>
            <input id="u206_input" type="checkbox" value="radio" name="Development" />
        </div>

        <!-- Unnamed (Radio Button) -->
        <div id="u207" class="ax_default radio_button">
          <label for="u207_input" style="position: absolute;">
            <div id="u207_text" class="text ">
              <p><span>Finishing</span></p>
            </div>
          </label>
            <input id="u207_input" type="checkbox" value="radio" name="Finishing" />
        </div>

        <!-- Unnamed (Radio Button) -->
        <div id="u208" class="ax_default radio_button">
          <label for="u208_input" style="position: absolute;">
            <div id="u208_text" class="text ">
              <p><span>Packing</span></p>
            </div>
          </label>
            <input id="u208_input" type="checkbox" value="radio" name="Packing" />
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u209" class="ax_default button">
        <div id="u209_div" class=""></div>
        <div id="u209_text" class="text ">
            <p><span><input type="submit" value="Generate performance report" /></span></p>
        </div>
      </div>
      </form>
      <!-- Unnamed (Horizontal Line) -->
      <div id="u210" class="ax_default line">
        <img id="u210_img" class="img " src="images/shift_manager_screen/u210.png"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u211" class="ax_default label">
        <div id="u211_div" class=""></div>
        <div id="u211_text" class="text ">
          <p><span>Select department</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u212" class="ax_default label">
        <div id="u212_div" class=""></div>
        <div id="u212_text" class="text ">
          <p><span>Staff report</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u213" class="ax_default line">
        <img id="u213_img" class="img " src="images/shift_manager_screen/u210.png"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u214" class="ax_default label">
        <div id="u214_div" class=""></div>
        <div id="u214_text" class="text ">
          <p><span>Customer report</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u215" class="ax_default line">
        <img id="u215_img" class="img " src="images/shift_manager_screen/u210.png"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u216" class="ax_default button">
        <div id="u216_div" class=""></div>
        <div id="u216_text" class="text ">
          <p><span>Generate staff effort report</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u217" class="ax_default button">
        <div id="u217_div" class=""></div>
        <div id="u217_text" class="text ">
          <p><span>Generate customer report</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u218" class="ax_default label">
        <div id="u218_div" class=""></div>
        <div id="u218_text" class="text ">
          <p></p><p></p>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u219" class="ax_default" data-left="31" data-top="479" data-width="170" data-height="24">

        <!-- Unnamed (Group) -->
        <div id="u220" class="ax_default" data-left="78" data-top="479" data-width="123" data-height="21">

          <!-- Unnamed (Text Field) -->
          <div id="u221" class="ax_default text_field">
            <input id="u221_input" type="text" value="24/07/2018"/>
          </div>

          <!-- Unnamed (Shape) -->
          <div id="u222" class="ax_default icon">
            <img id="u222_img" class="img " src="images/shift_manager_screen/u197.png"/>
          </div>
        </div>

        <!-- Unnamed (Rectangle) -->
        <div id="u223" class="ax_default label">
          <div id="u223_div" class=""></div>
          <div id="u223_text" class="text ">
            <p><span>From</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u224" class="ax_default" data-left="264" data-top="479" data-width="144" data-height="24">

        <!-- Unnamed (Group) -->
        <div id="u225" class="ax_default" data-left="288" data-top="479" data-width="120" data-height="21">

          <!-- Unnamed (Text Field) -->
          <div id="u226" class="ax_default text_field">
            <input id="u226_input" type="text" value="02/08/2018"/>
          </div>

          <!-- Unnamed (Shape) -->
          <div id="u227" class="ax_default icon">
            <img id="u227_img" class="img " src="images/shift_manager_screen/u202.png"/>
          </div>
        </div>

        <!-- Unnamed (Rectangle) -->
        <div id="u228" class="ax_default label">
          <div id="u228_div" class=""></div>
          <div id="u228_text" class="text ">
            <p><span>To</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Table) -->
      <div id="u229" class="ax_default">

        <!-- Unnamed (Table Cell) -->
        <div id="u230" class="ax_default table_cell">
          <img id="u230_img" class="img " src="images/shift_manager_screen/u230.png"/>
          <div id="u230_text" class="text ">
            <p><span>ID</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u231" class="ax_default table_cell">
          <img id="u231_img" class="img " src="images/shift_manager_screen/u230.png"/>
          <div id="u231_text" class="text ">
            <p><span>Name</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u232" class="ax_default table_cell">
          <img id="u232_img" class="img " src="images/shift_manager_screen/u232.png"/>
          <div id="u232_text" class="text ">
            <p><span>Role</span></p>
          </div>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u233" class="ax_default table_cell">
          <img id="u233_img" class="img " src="images/shift_manager_screen/u230.png"/>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u234" class="ax_default table_cell">
          <img id="u234_img" class="img " src="images/shift_manager_screen/u230.png"/>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u235" class="ax_default table_cell">
          <img id="u235_img" class="img " src="images/shift_manager_screen/u232.png"/>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u236" class="ax_default table_cell">
          <img id="u236_img" class="img " src="images/shift_manager_screen/u236.png"/>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u237" class="ax_default table_cell">
          <img id="u237_img" class="img " src="images/shift_manager_screen/u236.png"/>
        </div>

        <!-- Unnamed (Table Cell) -->
        <div id="u238" class="ax_default table_cell">
          <img id="u238_img" class="img " src="images/shift_manager_screen/u238.png"/>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u239" class="ax_default label">
        <div id="u239_div" class=""></div>
        <div id="u239_text" class="text ">
          <p><span>Selected staff</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u240" class="ax_default button">
        <div id="u240_div" class=""></div>
        <div id="u240_text" class="text ">
          <p><span>Select staff</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u241" class="ax_default label">
        <div id="u241_div" class=""></div>
        <div id="u241_text" class="text ">
          <p><span>Selected customer</span></p>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u242" class="ax_default" data-left="31" data-top="724" data-width="170" data-height="24">

        <!-- Unnamed (Group) -->
        <div id="u243" class="ax_default" data-left="78" data-top="724" data-width="123" data-height="21">

          <!-- Unnamed (Text Field) -->
          <div id="u244" class="ax_default text_field">
            <input id="u244_input" type="text" value="24/07/2018"/>
          </div>

          <!-- Unnamed (Shape) -->
          <div id="u245" class="ax_default icon">
            <img id="u245_img" class="img " src="images/shift_manager_screen/u197.png"/>
          </div>
        </div>

        <!-- Unnamed (Rectangle) -->
        <div id="u246" class="ax_default label">
          <div id="u246_div" class=""></div>
          <div id="u246_text" class="text ">
            <p><span>From</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Group) -->
      <div id="u247" class="ax_default" data-left="336" data-top="724" data-width="144" data-height="24">

        <!-- Unnamed (Group) -->
        <div id="u248" class="ax_default" data-left="360" data-top="724" data-width="120" data-height="21">

          <!-- Unnamed (Text Field) -->
          <div id="u249" class="ax_default text_field">
            <input id="u249_input" type="text" value="02/08/2018"/>
          </div>

          <!-- Unnamed (Shape) -->
          <div id="u250" class="ax_default icon">
            <img id="u250_img" class="img " src="images/shift_manager_screen/u202.png"/>
          </div>
        </div>

        <!-- Unnamed (Rectangle) -->
        <div id="u251" class="ax_default label">
          <div id="u251_div" class=""></div>
          <div id="u251_text" class="text ">
            <p><span>To</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (Droplist) -->
      <div id="u252" class="ax_default droplist">
        <select id="u252_input">
          <option selected value="M.Lark">M.Lark</option>
        </select>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u253" class="ax_default button">
        <div id="u253_div" class=""></div>
        <div id="u253_text" class="text ">
          <p><span>View customers</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u254" class="ax_default icon">
        <img id="u254_img" class="img " src="images/receptionist_screen/u88.png"/>
      </div>
    </div>
  </body>
</html>
