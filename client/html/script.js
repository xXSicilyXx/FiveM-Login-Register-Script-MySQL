var nui = angular.module('nui', []);
nui.controller('nuiController', function nuiController( $scope, $document, $window ) {
	
$scope.submitEnter = function(event) {
var email = $("#email").val();
//var username = $("#username").val();
var password = $("#password").val();
if( email != '' && password != '' ) {	
$.post('http://ft_login/ft_login:LoginServer', JSON.stringify({
email: $("#email").val(),
//username: $("#username").val(),
password: $("#password").val()
}));
} else {
$.post('http://ft_login/ft_login:LoginErrorServer', JSON.stringify({}));
}
}	


$scope.registerEnter = function(event) {
var email = $("#email").val();
//var username = $("#username").val();
var password = $("#password").val();
if( email != '' && password != '' ) {	
$.post('http://ft_login/ft_login:RegisterServer', JSON.stringify({
email: $("#email").val(),
//username: $("#username").val(),
password: $("#password").val()
}));
} else {
$.post('http://ft_login/ft_login:LoginErrorServer', JSON.stringify({}));
}
}

	
$scope.submitLeave = function(event) {		
$.post('http://ft_login/ft_login:LeaveServer', JSON.stringify({}));
}	
	
window.addEventListener('message', function(event) {		
if ( event.data.type == 'EnableGuiLogin' ) {					
document.body.style.display = event.data.StatusJs ? "block" : "none"; // If data 'StatusJs' is enable, change css to 'block'			
}		
});

});