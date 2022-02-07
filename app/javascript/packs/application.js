// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.    
import "popper.js";    
import "bootstrap";  
import "../stylesheets/application"
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start(); 
require("jquery")
require("channels");     
import "@fortawesome/fontawesome-free/css/all"  
require("./custom");
$(document).on('turbolinks:load', function(){
    setTimeout(function(){
        $('.alert').fadeOut();
    }, 10000);
});
require("trix");
require("@rails/actiontext");   
import $ from 'jquery';
window.jQuery = $;
window.$ = $; 
import * as bootstrap from "bootstrap";