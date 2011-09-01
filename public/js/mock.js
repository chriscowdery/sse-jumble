var index = 0;
$(document).ready(function(){
	$.mockjax({
		url: '/top10',
		responseTime: 0,
		response: function(){
			this.responseText = sample[index];
			index += 1;
			if(index == sample.length){
				index = 0;
			}
		}
	});

	getAjax();

});

var sample = [
{
	'status': 'good',
	'people': [
		{ 'name': 'Cody Krieger',                'points':100},
		{ 'name': 'Ben Nicholas',                'points':95},
		{ 'name': 'Chris Cowdery-Corvan',        'points':80},
		{ 'name': 'FreshmanWithALongName',       'points':71},
		{ 'name': 'Short Na',                    'points':70},
		{ 'name': 'Honey Badger',                'points':65},
		{ 'name': 'Huey Lewis',                  'points':10}
	]
}
,
{
	'status': 'good',
	'people': [
		{ 'name': 'Cody Krieger',                'points':100},
		{ 'name': 'Ben Nicholas',                'points':95},
		{ 'name': 'Chris Cowdery-Corvan',        'points':80},
		{ 'name': 'Trololol', 'points':71},
		{ 'name': 'Short Na',                    'points':70},
		{ 'name': 'Honey Badger',                'points':65},
		{ 'name': 'Huey Lewis',                  'points':30}
	]
}
,
{
	'status': 'good',
	'people': [
		{ 'name': 'Huey Lewis',                  'points':300},
		{ 'name': 'Cody Krieger',                'points':100},
		{ 'name': 'Ben Nicholas',                'points':95},
		{ 'name': 'Chris Cowdery-Corvan',        'points':80},
		{ 'name': 'Trololol', 'points':71},
		{ 'name': 'Short Na',                    'points':70},

		{ 'name': 'Honey Badger',                'points':65}

	]
}
];
