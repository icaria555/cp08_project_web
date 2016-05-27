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
//= require underscore-min
//= require_tree .


//************************** chart config*************************************
var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var DAYS = ["Monday", "Tuesday", "Wendeday", "Thuesday", "Friday", "Satuauday", "Sunday"]

var Da = _.range(100).map(function () { return '' })
var Xlength = _.range(7).map(function () { return '' })
        
var default_data = _.range(100).map(function () { return 0 })
var timeFormat = 'MM/DD/YYYY HH:mm';

var config_heartsig = {
    //config chart heart signal
    type: 'line',
    data: {
        labels: Da,
        datasets: [{
            data: default_data,
            fill: true,
        }]
    },
    options: {
        animationSteps: 5,
        responsive: true,
        title:{
            display:false,
            text:'Health Care'
        },
        elements:{
            point:{
                radius:0
            }
        },
        legend: {
            display: false
        },
        hover: {
            mode: 'dataset'
        },
        scales: {
            
            xAxes: [{
                display: true,
                scaleLabel: {
                    show: true,
                },
                gridLines: {
                    display: false
                },
            }],
            yAxes: [{
                display: false,
                gridLines: {
                    display: false
                },
                scaleLabel: {
                    show: true,
                    labelString: 'Value'
                },
                ticks: {
                    suggestedMin: 0,
                    suggestedMax: 100,
                }
            }]
        }
    }
};
var color = "rgba(75,192,192,0.4)"
var config_spo2 = {
    //config chart heart signal
    type: 'line',
    data: {
        labels: Xlength,
        datasets: [{
            data: default_data,
            fill: false,
            backgroundColor: color,
            pointBorderColor: color,
            borderColor: color,
        }]
    },
    options: {
        animationSteps: 5,
        responsive: true,
        title:{
            display:false,
            text:'Health Care'
        },

        legend: {
            display: false
        },
        hover: {
            mode: 'dataset'
        },
        scales: {
            
            xAxes: [{
                display: true,
                scaleLabel: {
                    show: true,
                },
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    display: true
                },
                scaleLabel: {
                    show: true,
                    labelString: 'Value'
                },
                ticks: {
                    suggestedMin: 30,
                    suggestedMax: 100,
                }
            }]
        }
    }
};

var updateChart = function(updata_data = "NoData"){
    /* 
    use for update Chart .It's only work for h_sig chart
    input : update data(length equal with chart x length)
    */
    $.each(config_heartsig.data.datasets, function(i, dataset) {
        //use for handle 304 code
        if(!updata_data) {
            dataset.data = default_data;
        } else {
            console.log(updata_data)
            var recieve_data = updata_data.split(",").map(function(int){
                return parseInt(int, 10);
            });
            console.log(recieve_data);
            console.log('test');
            dataset.data = recieve_data;
        }
    });
    window.myLine.update(); //update chart
}

var updateChart2 = function(updata_data = "NoData", chart){
    /* 
    use for update Chart .It's work for spo2 and h_rate chart
    input : update data(length equal with chart x length), chart object
    */
    
    chart.update(); //update chart
}

var updateData = function() {
    /*
    use for update chart and spo2, h_rate on show.html file by receive new data 
    from server 
    received data : h_signal, spo2, h_rate
    */
    $.ajax({url: $(location).attr('href'), type: "GET", ifModified:true, success: function(result, status, xhr){
        if(status == "success"){
            //use for handle 304 code
            updateChart(result['h_signal']);
            $("#spo2").text(result['spo2']);
            $("#h_rate").text(result['h_rate']);
            
            $("#addtd").prepend("<tr><td>" + result['spo2'] + 
            "</td><td>" + result['h_rate'] + 
            "</td><td>" + result['updated_at'] + "</td></tr>")
        }
        console.log(status);
    }});
}
var test = function(){
    /* 
    use for update Chart .It's work for spo2 and h_rate chart
    input : update data(length equal with chart x length), chart object
    */
    var recieve_data = $("#spo2_data").text().split(",").map(function(int){
                return parseInt(int, 10);
            });
    recieve_data.pop()//delete Nan element
    return recieve_data
}

var test2 = function(){
    /* 
    use for update Chart .It's work for spo2 and h_rate chart
    input : update data(length equal with chart x length), chart object
    */
    var recieve_data = $("#date_data").text().split(",").map(function(int){
                return parseInt(int, 10);
            });
    recieve_data.pop()//delete Nan element
    return recieve_data
}