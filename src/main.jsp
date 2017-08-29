<html>
<head>
    <title>get and set properties Example</title>
</head>

<body>
<jsp:useBean id = "students" class = "action.StudentsBean">
    <jsp:setProperty name = "students" property = "firstName" value = "Zara"/>
    <jsp:setProperty name = "students" property = "lastName" value = "Ali"/>
    <jsp:setProperty name = "students" property = "age" value = "10"/>
</jsp:useBean>

<p>Student First Name:
    ${students.firstName}
</p>

<p>Student Last Name:
    ${students.lastName}
</p>

<p>Student Age:
    ${students.age}
</p>

</body>
</html>