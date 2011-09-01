var slideInTime  = 500;
var slideOutTime = 500;
var resizeTime   = 2000;
var refreshTime  = 5000;

var max=1;
var bar;

function removeAll(){
	timeout = 600;
	$('.person').each(function(index) {
		setTimeout(function(){
    		slideOut(index);
		}, timeout);
		timeout -= 100;
	});	
}

function showAll(){
	timeout = 100;
	$('.person').each(function(index) {
		setTimeout(function(){
          slideIn(index);
		}, timeout);
		timeout += 100;
	});	
}

function changePerson(index, name, score){
	slideOut(index);
	maxChange = setPerson(index,name,score);
	
	setTimeout(function(){

		if(maxChange) { 
			resizeAll();	
		}
		else{
			instantResize(index);
		}
		slideIn(index);
	}, 1000);
}

function setPerson(index, name, score, timeout){
	timeout = typeof(timeout) != 'undefined' ? timeout : true;
	
	if(timeout){
    	setTimeout(function(){
         	$('.who')[index].innerHTML  = name;
         	$('.number span')[index].innerHTML = score;
    	}, 1000);
	}
    else{
     	$('.who')[index].innerHTML  = name;
     	$('.number span')[index].innerHTML = score;
	}
	
	if(index == 0 && score != max) { 
		max = score;
		return true;
	}
	else{
		return false;
	}
}

function slideOut(index){
	$($('.person')[index]).addClass('hidden');
}


function slideIn(index){
	$($('.person')[index]).removeClass('hidden');
}

function resizeAll(){
	$('.person').each(function(index) {
		resize(index);
	});
}

function resize(index){
	bar = $('.bar')[index];
	barValue = parseInt($('.number span')[index].innerHTML);
	barValue = (barValue / max) * 100;
	$(bar).animate({width: barValue.toString() + "%"},resizeTime,"easeOutQuint");
}

function instantResize(index){
	bar = $('.bar')[index];
	barValue = parseInt($('.number span')[index].innerHTML);
	barValue = (barValue / max) * 100;
	$(bar).css('width', barValue.toString() + "%");

}


//-----------------------------------------------------------

$(document).ready(function(){
	//getAjax();
});

function getAjax(){
	$.ajax({
		url: '/top10',
		success:function(data){
			handleData(data);
		},
		complete:function(){
			setTimeout(function(){getAjax()},refreshTime);
		}
	});

}

var previousData;
function handleData(data){
	var first = previousData == null;
	if(first){
		//removeAll();
	}
	$(data.people).each(function(index, person){
		if(first){
			setPerson(index,person.name,person.points,false);
		}
		else{
			prev = previousData.people[index];
			if(prev.name != person.name || prev.points != person.points){
				changePerson(index, person.name,person.points);
			}
		}
	});

	if(first){
		showAll();
		resizeAll();
	}

	previousData = data;
}
