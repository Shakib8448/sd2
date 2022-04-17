<?php
include('header.php');
include('dbcon.php');
?>


<div class="adminregister">
    <div class="admin-box">
        <div class="admin-text">
            <h1>REGISTRATION</h1>
            <form action="" method="post">
                <table>
                    <tr>
                        <td width="50%" height="50px">name</td>
                        <td width="50%" height="50px"> <input type="text" name="fn" id="fullname"  title="Enter fullname"></td>
                    </tr>
                    <tr>
                        <td width="50%" height="50px">Username</td>
                        <td width="50%" height="50px"> <input type="text" name="un" id="username"  title="Enter Username"></td>
                    </tr>
                    <tr>
                    <tr>
                        <td width="50%" height="50px">Email</td>
                        <td width="50%" height="50px"> <input type="text" name="email" id="email" title="enter email"></td>
                    </tr>
                        <td width="50%" height="50px">Password</td>
                        <td width="50%" height="50px"> <input type="Password" name="ps" id="password" title="Enter Password"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name="sub" id="btn" value="Register"></td>
                    </tr>
            </form>
            <?php
            include('connection.php');
            if(isset($_POST['sub']))
            {
                $name=$_POST['fn'];
                $username=$_POST['un'];
                $password=$_POST['ps'];
                $email=$_POST['email'];
                $qry="INSERT INTO `admin` (`name`, `username`, `email`, `password`) VALUES ('$name', '$username', '$email', '$password');";
                mysqli_query($con,$qry);
                header("Location: admin.php");
                die;
            }

            ?>

            <div class="register">
                <a href="admin.php" class="link">Login Here..</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>