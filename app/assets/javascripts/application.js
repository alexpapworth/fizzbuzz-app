// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function updatePageSize() {
	console.log(this.value);

	// manual version of remote: true
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			
				eval(xmlHttp.responseText);
				ready();

				href = window.location.origin + window.location.pathname + "?page=" + document.querySelector('.page.active').innerText
					 + "&size=" + document.querySelector('#size').value;

				window.history.pushState({}, "FizzBuzzApp", href);
		}
	}

	currentHref = window.location.href;
	pageTest = currentHref.match(/page=(?<page>\d+)/);
	sizeTest = currentHref.match(/size=(?<size>\d+)/);

	params = ""
	if (pageTest != null) {
		params += "page=" + pageTest.groups.page + "&";
	}
	else {
		params += "page=1&";
	}
	params += "size=" + this.value;

	href = window.location.origin + window.location.pathname + "page_size?" + params
		 + "&start_number=" + document.querySelector('.number').innerText;

	xmlHttp.open("GET", href, true); // true for asynchronous
	xmlHttp.setRequestHeader("Accept", "text/javascript, application/javascript");
	xmlHttp.send(null);
}

var ready;

ready = function() {
	console.log('hi!');
	if (document.querySelector('#size')) {
		document.querySelector('#size').addEventListener('input', updatePageSize);
	}
}

document.addEventListener('turbolinks:load', ready);