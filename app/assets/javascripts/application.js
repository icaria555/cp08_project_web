// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require Chart.bundle
//= require_tree .

function test() {
	var xhttp;

	alert("hello you suckker")
}


//************************** chart config*************************************
var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        
var randomScalingFactor = function() {
	return Math.round(Math.random() * 100);
	//return 0;
};
var randomColorFactor = function() {
    return Math.round(Math.random() * 255);
};

var randomColor = function(opacity) {
    return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',' + (opacity || '.3') + ')';
};

var default_data = Array.apply(null, {length: 100}).map(Function.call, Number)


var config = {
    type: 'line',
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            data: default_data,
            fill: false,
            borderDash: [5, 5],
        }]
    },
    options: {
        responsive: true,
        title:{
            display:false,
            text:'Health Care'
        },
        tooltips: {
            mode: 'label',
            callbacks: {
                // beforeTitle: function() {
                //     return '...beforeTitle';
                // },
                // afterTitle: function() {
                //     return '...afterTitle';
                // },
                // beforeBody: function() {
                //     return '...beforeBody';
                // },
                // afterBody: function() {
                //     return '...afterBody';
                // },
                // beforeFooter: function() {
                //     return '...beforeFooter';
                // },
                // footer: function() {
                //     return 'Footer';
                // },
                // afterFooter: function() {
                //     return '...afterFooter';
                // },
            }
        },

        hover: {
            mode: 'dataset'
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    show: true,
                    labelString: 'Month'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    show: true,
                    labelString: 'Value'
                },
                ticks: {
                    suggestedMin: -10,
                    suggestedMax: 250,
                }
            }]
        }
    }
};

$.each(config.data.datasets, function(i, dataset) {
    dataset.borderColor = randomColor(0.4);
    dataset.backgroundColor = randomColor(0.5);
    dataset.pointBorderColor = randomColor(0.7);
    dataset.pointBackgroundColor = randomColor(0.5);
    dataset.pointBorderWidth = 1;
});
$( document ).ready(function() {
	$('#randomizeData').click(function() {
		console.log("pass")
		alert($(location).attr('href'))
	    $.each(config.data.datasets, function(i, dataset) {
	        dataset.data = dataset.data.map(function() {
	            return randomScalingFactor();
	        });
	
	    });
	    window.myLine.update();
	});
});

var randomScalingFactor = function() {
    return Math.round(Math.random() * 100);
    //return 0;
};

var updateChart = function() {
    //console.log($(this).attr('href'))
	$.each(config.data.datasets, function(i, dataset) {
        dataset.data = dataset.data.map(function() {
            return randomScalingFactor();
        });

    });
    $.ajax({url: $(location).attr('href'), success: function(result){
        console.log(result)
    }});
    window.myLine.update();
}