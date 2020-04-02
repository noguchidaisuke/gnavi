function getMyPlace() {
  function success(position) {
    var latitude  = position.coords.latitude;//緯度
    var longitude = position.coords.longitude;//経度
    // 位置情報
    var latlng = new google.maps.LatLng( latitude , longitude ) ;
    document.getElementById('latlng').value = latlng;
  };
  function error() {
    output.innerHTML = "座標位置を取得できません";
  };
  navigator.geolocation.getCurrentPosition(success, error);//成功と失敗を判断
}
$(document).ready(function(){
  getMyPlace();
})
$(document).on('click', function(e) {
	// ２．クリックされた場所の判定
	if(!$(e.target).closest('#pop_up').length && !$(e.target).closest('#inputarea').length){
		$('#pop_up').hide();
	}else if($(e.target).closest('#inputarea').length){
    // ３．ポップアップの表示状態の判定
    $('#pop_up').show();
  }
});
$('#current_point').click(function() {
    $('#pop_up').hide();
    getMyPlace();
    document.getElementById('inputarea').value="現在地";
})