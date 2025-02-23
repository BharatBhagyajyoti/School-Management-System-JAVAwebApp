<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admission Form</title>
</head>
<body bgcolor="snow">
<fieldset>    
    <center><h1>SARASWATI SISHU VIDYA MANDIR</h1></center>
    <img src="Images/img.png" width="150" height="150">

    <img src="Images/img.png" width="150" height="150" align="right">

    <hr color="red">
    <marquee bgcolor="azure" onmouseover="this.stop();" onmouseout="this.start();" scrollamount="12"><img src="Images/download.jpg" width="30" height="30">ADMISSION FORM 
    &nbsp; &nbsp;<img src="Images/download.png" width="30" height="30">REGISTRATION FORM</marquee>
    <hr color="red">

    <CENTER><h2>ADMISSION FORM</h2></CENTER>
    <fieldset>
        <legend>Student Details</legend>
    <form>
        <table>
            <tr>
                <td>
                    First name:
                </td>
                <td>
                    <input type="text" placeholder="First name"name="">&nbsp; &nbsp;
                </td>

                <td>
                    Middle name:
                </td>
                <td>
                    <input type="text" placeholder="Middle name"name="">
                </td>

                <td>
                    Last name:
                </td>
                <td>
                    <input type="text" placeholder="Last name"name="">
                </td>
            </tr>

            <tr>
                <td>
                    Father name:
                </td>
                <td>
                    <input type="text"name="">
                </td>
            </tr>

            <tr>
                <td>
                    Mother name:
                </td>
                <td>
                    <input type="text"name="">
                </td>
            </tr>

            <tr>
                <td>
                    Postal Address:
                </td>
                <td>
                    <input type="text"name="">
                </td>
            </tr>

            <tr>
                <td>
                    Personal Address:
                </td>
                <td>
                    <input type="text"name="">
                </td>
            </tr>
            <tr>
                <td>
                    Gender:
                </td>
                <td>
                    <input type="radio"name="gender"value="male">male
                </td>
                <td>
                    <input type="radio"name="gender"value="female">female
                </td>
            </tr>
            <tr>
                <td>
                    Class:
                </td>
                <td>
                    <select name="course">
                        <option value="-1"selected>selected..</option>
                        <option value="1st">1st</option>
                        <option value="2nd">2nd</option>
                        <option value="3rd">3rd</option>
                        <option value="4th">4th</option>
                        <option value="5th">5th</option>
                        <option value="6th">6th</option>
                        <option value="7th">7th</option>
                        <option value="8th">8th</option>
                        <option value="9th">9th</option>
                        <option value="10th">10th</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    District:
                </td>
                <td>
                    <select name="">
                        <option value="-1"selected>selected..</option>
                        <option value="keonjhar">KEONJHAR</option>
                        <option value="khorda">KHORDA</option>
                        <option value="dhenkanal">DHENKANAL</option>
                        <option value="cuttack">CUTTACK</option>
                        <option value="bhubaneswar">BHUBANESWAR</option>
                        <option value="kendrapara">KENDRAPARA</option>
                        <option value="jagatsinghpur">JAGATSINGHPUR</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <input type="text" placeholder="email-id" name="Email"id="">
                </td>

                <td>
                    DOB:
                </td>
                <td>
                    <input type="date" placeholder="date of birth" name="">
                </td>
            </tr>
            <tr>
                <td>
                    Mobile no:
                </td>
                <td>
                    <input type="tel" id="phone"name="phone" placeholder="123-45-67-890"maxlength="10" pattern="[0-9]{10}">
                </td>
            </tr>
            <tr>
                <td>
                    Adhaar no:
                </td>
                <td>
                    <input type="tel" id="aadhar" placeholder="XXXX-XXXX-1234"maxlength="12" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}"name="">
                </td>
            </tr>
            
        </table>
    </form>

</fieldset>
<br>
<br>
<hr width="100%"size="2px"color="red">
<h3>DECLARATION:</h3>
<p>i do hereby declare that the above details which i have filled are correct and to the best of my knowledge.</p>
<br>
<form>
    <input type="checkbox"name=""required="required">I Agree
    <hr width="100%"size="2px"color="red">
    <center>
        <tr>
            <td>
                <input type="submit"value="reset">
            </td>
            <td>
                <input type="submit"value="submit">
            </td>
        </tr>
    </center>
</form>
</fieldset>

<!-- Script to restrict character input in "Phone number" -->

<script>
    const phoneInput = document.getElementById("phone");
  
    phoneInput.addEventListener("keypress", function(event) {
      const char = String.fromCharCode(event.charCode);
      if (!/\d/.test(char)) {
        event.preventDefault();
      }
    });
</script>

<!-- Script to restrict character input in "Aadhar number" -->


<script>
    const aadharInput = document.getElementById("aadhar");
  
    phoneInput.addEventListener("keypress", function(event) {
      const char = String.fromCharCode(event.charCode);
      if (!/\d/.test(char)) {
        event.preventDefault();
      }
    });

    
  </script>
 
</body>

</html>