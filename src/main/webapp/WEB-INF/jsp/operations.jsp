<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="bankOperationsModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CBA-Operations Home Page</title>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.6/angular.js"></script>

<script type="text/javascript">
var app=angular.module("bankOperationsModule",[]);
app.controller("bankOperationsController",function($scope,$window,$http){
	   $scope.depositWindowFlag=false;
	   $scope.showDepositWindow=function(){
		   $http({
	  method:"get",
	  url:"/CBA-Controller/deposit",
	  }).then(function(result){	  
		  $scope.depositWindowFlag=true;
	  },function(result){
		  $window.alert("Server response-SUCCESS!Please Try Again");  
	  });  
	   } 
	   
	  $scope.getAccountSummary=function(){
		  $http({
			method:"get",
			url:"getAccountSummary",
			params:{
			"accountNumber":$scope.accountNumber	
			}
		  }).then(function(result){
			  $window.alert("ok");
		  },function(result){
			  $window.alert("failure");
		  }); 
	   }
   });
</script>
</head>
<body ng-controller="bankOperationsController">
<h1>Commonwealth Bank of Australia</h1>
<hr>
<h3>Select Operation</h3> <br>
<div>
<table>
<tr>
<td>
<button ng-click="showDepositWindow()">DEPOSIT</button>
</td>
<td>
<button type="button">WITHDRAW</button>
</td>
<td>
<button type="button">TRANSFER</button>
</td>
<td>
<button type="button">VIEW</button>
</td>
<td>
<button type="button">REPORT</button>
</td>
</tr></table></div>
<hr>
<div ng-show="depositWindowFlag">

<table border="1">
<tr><td colspan="3"><label>Deposit Window</label></td></tr>
<tr><td>
<label>ENTER ACCOUNT NUMBER:</label></td>
<td><input type="text" ng-model="accountNumber"/></td>
<td><button ng-click="getAccountSummary()">VALIDATE</button></td>
</tr></table>
</div>

</body>
</html>