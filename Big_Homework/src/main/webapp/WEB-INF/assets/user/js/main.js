/*price range*/

$('#sl2').slider();

var RGBChange = function() {
	$('#RGB').css('background', 'rgb(' + r.getValue() + ',' + g.getValue() + ',' + b.getValue() + ')')
};

/*scroll to top*/

$(document).ready(function() {
	$(function() {
		$.scrollUp({
			scrollName: 'scrollUp', // Element ID
			scrollDistance: 300, // Distance from top/bottom before showing element (px)
			scrollFrom: 'top', // 'top' or 'bottom'
			scrollSpeed: 300, // Speed back to top (ms)
			easingType: 'linear', // Scroll to top easing (see http://easings.net/)
			animation: 'fade', // Fade, slide, none
			animationSpeed: 200, // Animation in speed (ms)
			scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
			//scrollTarget: false, // Set a custom target element for scrolling to the top
			scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
			scrollTitle: false, // Set a custom <a> title if required.
			scrollImg: false, // Set true to use image
			activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
			zIndex: 2147483647 // Z-Index for the overlay
		});
	});

	$("#image_thumb img").click(function() {
		var large = $(this).attr('src');

		console.log(large);
		$("#image_large").attr('src', large);
	});

	$("#btnAddToCart").click(function(event) {
		var quantityInStock = document.getElementById("quantityInStock").innerText;
		var input = document.getElementById("inputQuantity").value;
		if (parseInt(input) > parseInt(quantityInStock)) {
			alert("Bạn đã thêm vượt quá số lượng hàng trong kho");
			event.preventDefault();
		}
	});

	$(".up").click(function() {
		var input = $(this).closest(".cart_quantity_button").find(".inputQuantity");
		var quantityInStock = $(this).parent().parent().parent().find(".quantityInStock");
		var quantity = parseInt(quantityInStock[0].innerText,10);
		var value = parseInt(input[0].value, 10);
		
		value = isNaN(value) ? 0 : value;
		if (value == quantity) {
			input[0].setAttribute("value", quantity);
			console.log(input[0].value);
			
		} else {
			value++;
			input[0].setAttribute("value", value);
			console.log(value);
			console.log(input[0].value);
		}
	});
	

	$(".down").click(function() {
		var input = $(this).closest(".cart_quantity_button").find(".inputQuantity");
		var value = parseInt(input[0].value, 10);
		if (value > 1) {
			value = isNaN(value) ? 0 : value;
			value--;
			input[0].setAttribute("value", value);
		}
	});
	
	
});
function increaseCount(a, b) {
	var input = b.previousElementSibling;
	var quantityInStock = document.getElementById("quantityInStock").innerText;
	var value = parseInt(input.value, 10);
	value = isNaN(value) ? 0 : value;
	if (input.value == quantityInStock) {
		input.value = quantityInStock;
	} else {
		value++;
		input.value = value;
	}
};


function decreaseCount(a, b) {
	var input = b.nextElementSibling;
	var value = parseInt(input.value, 10);
	if (value > 1) {
		value = isNaN(value) ? 0 : value;
		value--;
		input.value = value;
	}
};
