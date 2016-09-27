$(document).ready(function() {
  clearWindow();
  displayLoginForm();
  login();
  generateQuestionForm();
  displayNewQuestion();
  answerQuestion();
  viewPersonalRecords();
  attendClass();
  viewClassRecords();
  viewIndividualRecords();
});

function clearWindow() {
  $("#navBar").on("click", "#clearWindow", function(event){
    event.preventDefault()
    
    $(".removable").remove();
  });
};

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
        $("#loginForm").css("display", "none");
        $("#menu").append(menu);
        $("#menu").css("display", "block");
      });
  });
};

function generateQuestionForm(){
  $("#homePage").on("click", "#generateQuestionForm", function(event){
    event.preventDefault();
    var method = 'GET';
    var url = $(this)[0].href;

    $.ajax({
      method: method,
      url: url
    })
      .done(function(form){
        $("#homePage").append(form);
      });
  });
};

function displayNewQuestion(){
  $("#homePage").on("submit", "#generateQuestion", function(event){
    event.preventDefault()
    var method = $(this)[0].method;
    var url = $(this)[0].action;
    var data = $(this).serialize();

    $.ajax({
      method: method,
      url: url,
      data: data
    })
      .done(function(question){
        $("#homePage").append(question);
      });
  });
};

function answerQuestion(){
  $("#homePage").on("submit", "#answerQuestion", function(event){
    event.preventDefault();
    var method = $(this)[0].method;
    var url = $(this)[0].action;
    var data = $(this).serialize();

    $.ajax({
      method: method,
      url: url,
      data: data
    })
      .done(function(message){
        $("#answerQuestion").parent().text(message);
        $("#answerQuestion").css("display", "none")
      });
  });
};

function viewPersonalRecords() {
  $("#homePage").on("click", "#personalRecords", function(event){
    event.preventDefault()
    var method = 'GET';
    var url = $(this)[0].href;

    $.ajax({
      method: method,
      url: url
    })
      .done(function(form){
        $("#homePage").append(form);
      });
  });
};

function attendClass() {
  $("#homePage").on("click", "#studentAttend", function(event){
    event.preventDefault()
    var method = 'GET';
    var url = $(this)[0].href;

    $.ajax({
      method: method,
      url: url
    })
      .done(function(form){
        $("#homePage").append(form);
        $("#menu").css("display", "none");
      });
  });
};

function viewClassRecords() {
  $("#homePage").on("click", "#classRecords", function(event){
    event.preventDefault()
    var method = 'GET';
    var url = $(this)[0].href;

    $.ajax({
      method: method,
      url: url
    })
      .done(function(form){
        $("#homePage").append(form);
      });
  });
};

function viewIndividualRecords() {
  // teacher looks at individual records
};