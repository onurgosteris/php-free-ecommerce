<div class="menu-mobile">
	<ul class="topbar-mobile"> 
		<?php 
		$menusor = $db->wread2("menu","menu_ust",0,[
			"columns_name" => "menu_sira",
			"columns_sort" => "asc"
			]);
		while ($menucek=$menusor->fetch(PDO::FETCH_ASSOC)) { ?> 
		<li 
		<?php 
		if (!empty($menucek['menu_icon'])) { ?>
		class="label1" data-label1="<?php echo $menucek['menu_icon'] ?>"
		<?php } ?>
		>
		<a href="<?php echo $menucek['menu_url']; ?>"><?php echo $menucek['menu_ad'] ?></a>
		<?php 
		$ustmenusor=$db->wread("menu","menu_ust",$menucek['menu_id']);
		if (!empty($ustmenusor['menu_ad'])) { ?>
		<ul class="sub-menu">
			<?php 
			$tummenuler = $db->wread2("menu","menu_ust",$menucek['menu_id']);
			while ($tummenulericek=$tummenuler->fetch(PDO::FETCH_ASSOC)) { ?>
			<li>
				<a href="<?php echo $tummenulericek['menu_url']; ?>"><?php echo $tummenulericek['menu_ad'] ?></a>
			</li>
			<?php } ?>
		</ul>
		<?php } ?>
	</li> 
	<?php } ?>
</ul>

	<ul class="main-menu-m">
		<?php 
		$menusor = $db->wread2("menu","menu_ust",0,[
			"columns_name" => "menu_sira",
			"columns_sort" => "asc"
			]);
			while ($menucek=$menusor->fetch(PDO::FETCH_ASSOC)) { ?> 
			<li>
				<a href="<?php echo $menucek['menu_url'] ?>" <?php 
					if (!empty($menucek['menu_icon'])) { ?>
					class="label1 rs1"" data-label1="<?php echo $menucek['menu_icon'] ?>"
					<?php } ?> ><?php echo $menucek['menu_ad'] ?></a>

					<?php 
					$ustmenusor=$db->wread("menu","menu_ust",$menucek['menu_id']);
					if (!empty($ustmenusor['menu_ad'])) { ?>
					<ul class="sub-menu-m">
						<?php 
						$tummenuler = $db->wread2("menu","menu_ust",$menucek['menu_id']);
						while ($tummenulericek=$tummenuler->fetch(PDO::FETCH_ASSOC)) { ?>
						<li>
							<a href="<?php echo $tummenulericek['menu_url'] ?>"><?php echo $tummenulericek['menu_ad'] ?></a>
						</li> 
						<?php } ?>
					</ul>
					<span style="width: 120%;" class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
					<?php } ?> 

				</li>   
				<?php } ?>
			</ul>
		</div>