<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Expanded:400,600,700" rel="stylesheet">
	
	<!-- Stylesheets -->
	
	<link rel="shortcut icon" type="image/png" href="images/favicon.png"/>

	<link href="plugin-frameworks/bootstrap.css" rel="stylesheet">
	
	<link href="fonts/ionicons.css" rel="stylesheet">
	

	<link href="common/styles.css" rel="stylesheet">
	
</head>
<body>
	<?php 
	require_once "src/netting/class.crud.php";
	$db = new crud();
	$parametreler = json_decode(file_get_contents("https://www.freeforexapi.com/api/live"),true);
	echo "<pre>";
	unset($parametreler["supportedPairs"][0]);
	unset($parametreler["supportedPairs"][1]);
	unset($parametreler["supportedPairs"][2]);
	unset($parametreler["supportedPairs"][3]);
	unset($parametreler["supportedPairs"][4]);
	$sayac = count($parametreler["supportedPairs"]);
	$mesaj = "https://www.freeforexapi.com/api/live?pairs=";
	for ($i=0; $i < $sayac ; $i++) { 
		$mesaj = $mesaj.$parametreler["supportedPairs"][$i].",";
	}
	$mesaj = rtrim($mesaj,",");

	$fiyatlar = json_decode(file_get_contents($mesaj),true);
//print_r($fiyatlar["rates"]);

// USD/TRY Yİ ALIP USD/SONRAKİBORSA FİYATINI ALIP SONRAKİBORSA TRY/SONRAKİBORSA YAPARSAK GÜNCEL TRY DEĞERİNİ BULURSUN

	$tr = $fiyatlar["rates"]["USDTRY"]["rate"];
	for ($i=0; $i < $sayac; $i++) { 
		$anlikparametre = $parametreler["supportedPairs"][$i];
		if (!is_null($fiyatlar["rates"][$anlikparametre]["rate"])) {
		$guncelparametre = substr($anlikparametre,3); // BAŞLARDAKİ USD YAZISINI KALDIRDIK
		$trfiyatlari[$guncelparametre] = $tr/$fiyatlar["rates"][$anlikparametre]["rate"];
	}
}

// ARTIK $trfiyatlari[İSTEDİĞİMİZ PARA BİRİMİ] şeklinde kullanabiliriz. 
// Yarın bunlar için veritabanı oluştur
// Veritabanında Birim,Güncel değer, Eski değer, Ve saniyelik date sütunları oluştur.


// ÖNEMLİ : VERİTABANINDA GÜNCELLEME YAPMADAN ÖNCE GÜNCEL DEĞER VE ESKİ DEĞER AYNI İSE GÜNCELLEME YAPMAYACAĞIZ YOKSA HER GÜNCELLEME YAPIŞIMIZ VERİTABANINA EKLENİR VE FİYAT DEĞİŞMEDEN GÜNCELLEME YAPTIĞIMIZDA FİYAT DEĞİŞMEDEN GÜNCELLEDİĞİMİZ İÇİN GÜNCEL VE ESKİ DEĞER BİRBİRİNE EŞİT OLUR.
$arraykeys = array_keys($trfiyatlari);
$sayac = count($arraykeys);

print_r($trfiyatlari);
date_default_timezone_set('Europe/Istanbul');
// DÖVİZ KURLARINI GÜNCELLEME KISMI
for ($i=0; $i < $sayac; $i++) { 
	$tarih = date("Y-m-d H:i:s");
	$id = $i+2;
	$dovizsor=$db->wread("doviz","id",$id);
	$dovizcek=$dovizsor->fetch(PDO::FETCH_ASSOC);
	if ($dovizcek['doviz_deger']!=number_format($trfiyatlari[$arraykeys[$i]],5)) {
		$ekle=$db->update("doviz",[
			"id" => $id,
			"doviz_kisaltma" => $arraykeys[$i],
			"doviz_deger" => number_format($trfiyatlari[$arraykeys[$i]],5),
			"doviz_tarih" => $tarih
			],[
			"columns" => "id"
			]);
		if ($ekle) {
			echo "Değer güncellendi. Veritabanında güncelleme yapıldı Eski Değer : ".$dovizcek['doviz_deger']." Yeni deger : ".number_format($trfiyatlari[$arraykeys[$i]],5)."<br>";
			$eskideger=$db->update("doviz",[
				"id" => $id,
				"doviz_eskideger" => $dovizcek['doviz_deger']
				],[
				"columns" => "id"
				]);
		}
	}else{
		echo "Değer aynı hala güncellenmediği için veritabanında güncellenmedi.".$dovizcek['doviz_kisaltma']." - ".$dovizcek['doviz_deger']."<br>";
	}


}


?>







<!-- <div style="width: 300px;"> YAZDIRMA KISMI
	<ul class="list-block list-li-ptb-15 list-btm-border-white bg-primary text-center">
		<?php 
		
		for ($i=0; $i < $sayac ; $i++) { 
			?>
			<li><b>1 <?php echo $arraykeys[$i] ?> = <?php echo number_format($trfiyatlari[$arraykeys[$i]],4) ?> ₺</b></li>
			<?php } ?>
		</ul>
	</div>
</body>
</html>
-->
