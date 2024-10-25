	
$(document).on('click', ".shared", function() {	
	var url = window.location.href;
	var title = document.title;
	
	url = encodeURIComponent(url);
	title = encodeURIComponent(title);
	
	//Boton Facebook
	if($(this).hasClass('fb')){	
		url = 'https://www.facebook.com/sharer/sharer.php?u='+url+'&t='+title;

	//Boton Twitter
	}else if($(this).hasClass('tt')){
		user = ' ';//Nuestro usuario de twitter para mostrar como @user
		url = 'https://twitter.com/intent/tweet?text='+title+'&url='+url+'&via='+user;
	
	//Boyton Google Plus
	}else if($(this).hasClass('gp')){
		url = 'https://plus.google.com/share?url='+url;
	
	//Boton correo electronico
	}else if($(this).hasClass('ce')){
		url = 'mailto:?subject='+title+'&body='+url;	
		
	//Ningun boton valido
	}else return;
	
	//Abrimos la url
	window.open(url, '_blank');			
});
