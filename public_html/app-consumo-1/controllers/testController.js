angular.module('myApp', ['testService']);

angular.module('myApp').controller('testController', ['$scope','testRequest',testController]);
function testController($scope, testRequest) {
	$scope.posts={};
	$scope.mensaje="";
	
	$scope.getAllCodigos = function(){
		testRequest.posts().then(function (data){
      console.log("...");
      console.log(data.data);
			$scope.posts=data.data; // Asignaremos los datos de todos los posts
			$scope.posts.exist=1;
		});
	}

	$scope.getCodigo = function(){
		$scope.unPost={};
		testRequest.post($scope.post_id).then(function (data){
			$scope.unPost=data.data; // Asignaremos los datos del post
			$scope.unPost.exist=1;
			$scope.posts.exist=0;
		});
	}
	$scope.crear = function(){
		datos = {'idcodigo': $scope.a.idcodigo, 'id_usuario': $scope.a.id_usuario, 'enlace': $scope.a.enlace, 'codigodes': $scope.a.codigodes, 'referencia': $scope.a.referencia}
		testRequest.add_post(datos).then(function (data){
			$scope.mensaje=data.status; // Asignaremos los datos del post
			console.log(data);
		});
	}

	$scope.deletecod = function(){
		console.log($scope.post_id);
		$scope.unPostdel={};
		testRequest.del_post($scope.post_id);
	}

	$scope.actualizar = function(){
		datos = {'idcodigo': $scope.unPost.idcodigo, 'id_usuario': $scope.unPost.id_usuario, 'enlace': $scope.unPost.enlace, 'codigodes': $scope.unPost.codigodes, 'referencia': $scope.unPost.referencia}
		testRequest.put_post($scope.unPost.idcodigo, datos).then(function(data){
			$scope.mensaje=data.status; // Asignaremos los datos del post
			console.log(data);
		});
	}

}
