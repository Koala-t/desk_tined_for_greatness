$(document).ready(function() {
  displayLoginForm();
  login();
});

function displayLoginForm() {
  $("#navBar").on("click", "#signIn", function(event) {
    event.preventDefault();
    $.ajax({
      method: "get",
      url: '/sessions/new'
    })
      .done(function(form){
        $("#navBar").append(form); 
        $("#signIn").css("display", "none"); 
      });
  });
};

function login() {
  $("#navBar").on("click", "#loginButton", function(event){
    event.preventDefault();
    var form = $(this).parent()[0];
    var method = $(this).parent()[0].method;
    var url = $(this).parent()[0].action;
    var data = $(form).serialize();

    $.ajax({
      method: method,
      url: url,
      data: data
    })
      .done(function(menu){
        console.log(menu);
        // alert('in done')
        $("#loginForm").css("display", "none");
        $("#menu").append(menu);
        $("#menu").css("display", "block");
      });
  });
};