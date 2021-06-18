// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap    
import "../../assets/stylesheets/application";     
import "bootstrap"; 
import "popper.js";   
import $ from 'jquery';
import "@fortawesome/fontawesome-free/css/all"
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");    
require("./custom");
$(document).on('turbolinks:load', function(){
    setTimeout(function(){
        $('.alert').fadeOut();
    }, 10000);
});
require("trix");
require("@rails/actiontext");
require('data-confirm-modal');