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
  hostClass();
  leaveClass();
  displayNumbersBreakdown();
  displayNumbersChart();
  displayClassChart();
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
        $("#loginForm").css("display", "inline-block"); 
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
        $("#navBar").append(
          '<a class="removable" id="retrieveMenu" href="/">Menu</a>');
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
  $("#homePage").on("click", ".inspectStudentRecord", function(event){
    event.preventDefault()
    var method = 'GET';
    var url = $(this)[0].href;
    var element = $(this).parent().children().last()[0];

    $.ajax({
      method: method,
      url: url
    })
      .done(function(form){
        $(element).append(form);
        $(element).toggle();
      });
  });
};

function hostClass() {
  $("#homePage").on("click", "#hostClass", function(event){
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
        $("#navBar").append(
          '<a class="removable" id="retrieveMenu" href="/">Menu</a>');
      });
  });
};

function leaveClass(){
  $("#navBar").on("click", "#retrieveMenu", function(event){
    event.preventDefault()
    var method = 'GET';
    var url = $(this)[0].href;

    $.ajax({
      method: method,
      url: url
    })
      .done(function(form){
        $(".removable").remove()
        $("#menu").css("display", "block");
      });
  });
};

function displayNumbersBreakdown(){
  $("#homePage").on("click", ".resultTable", function(event){
    event.preventDefault();

    var link = $(this)
    var container = $(this).parent()
    var linkPath = $(this).attr("href")
    var request = $.ajax({
      method: 'GET',
      url: linkPath
    });

    request.done(function(table){
      $(container).append(table)
      $(link).toggle()
    });
  });
};

function displayNumbersChart(){
  $("#homePage").on("click", ".resultChart", function(event){
    event.preventDefault();

    var link = $(this)
    var container = $(this).parent()[0]
    var linkPath = $(this).attr("href")
    
    var request = $.ajax({
      method: 'GET',
      url: linkPath
    });

    request.done(function(chart){
      $(container).append(chart)
      $(link).toggle()
    });
  });
};

function displayClassChart(){
  $("#homePage").on("click", ".class-tab", function(event){
    event.preventDefault();

    var tab = $(this)[0];
    var link = $(tab).find("a")[0];
    var path = $(link).attr("href");
    
    var request = $.ajax({
      method: 'GET',
      url: path
    });

    request.done(function(chart){
      $("#display_for_charts").empty()
      $("#display_for_charts").append(chart);

      $(".class-tab").removeClass("active");
      $(tab).addClass("active");
    });
  });
};