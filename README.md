# prestasift
Prestashop code static analysis and vulnerabilities

## Quick run
```sh
$ ./check.sh
```
### Output
```sh
modules/ps_mainmenu/ps_menutoplinks.class.php:86:28:type="Insert_ID", query=""
modules/ps_mainmenu/ps_menutoplinks.class.php:91:24:type="insert", query="
                'linksmenutop_lang',
                array(
                    'id_linksmenutop'=>(int)$id_linksmenutop,
                    'id_lang'=>(int)$id_lang,
                    'id_shop'=>(int)$id_shop,
                    'label'=>pSQL($label),
                    'link'=>pSQL($link[$id_lang])
                )
            "
modules/ps_mainmenu/ps_menutoplinks.class.php:115:9:type="update", query="
            'linksmenutop',
            array(
                'new_window'=>(int)$newWindow,
                'id_shop' => (int)$id_shop
            ),
            'id_linksmenutop = '.(int)$id_link
        "
modules/ps_mainmenu/ps_menutoplinks.class.php:125:13:type="update", query="
                'linksmenutop_lang',
                array(
                    'id_shop'=>(int)$id_shop,
                    'label'=>pSQL($label),
                    'link'=>pSQL($link[$id_lang])
                ),
                'id_linksmenutop = '.(int)$id_link.' AND id_lang = '.(int)$id_lang
            "
modules/ps_mainmenu/ps_menutoplinks.class.php:140:20:type="delete", query="'linksmenutop', 'id_linksmenutop = '.(int)$id_linksmenutop.' AND id_shop = '.(int)$id_shop"
modules/ps_mainmenu/ps_menutoplinks.class.php:141:20:type="delete", query="'linksmenutop_lang', 'id_linksmenutop = '.(int)$id_linksmenutop"
modules/ps_imageslider/ajax_ps_imageslider.php:41:10:type="execute", query="'
			UPDATE `'._DB_PREFIX_.'homeslider_slides` SET `position` = '.(int)$position.'
			WHERE `id_homeslider_slides` = '.(int)$id_slide
		"
modules/ps_imageslider/Ps_HomeSlide.php:69:11:type="execute", query="'
			INSERT INTO `'._DB_PREFIX_.'homeslider` (`id_shop`, `id_homeslider_slides`)
			VALUES('.(int)$id_shop.', '.(int)$this->id.')'
		"
modules/ps_imageslider/Ps_HomeSlide.php:90:11:type="execute", query="'
			DELETE FROM `'._DB_PREFIX_.'homeslider`
			WHERE `id_homeslider_slides` = '.(int)$this->id
		"
modules/ps_mainmenu/ps_mainmenu.php:111:17:type="execute", query="'
		CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'linksmenutop` (
			`id_linksmenutop` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
			`id_shop` INT(11) UNSIGNED NOT NULL,
			`new_window` TINYINT( 1 ) NOT NULL,
			INDEX (`id_shop`)
		) ENGINE = '._MYSQL_ENGINE_.' CHARACTER SET utf8 COLLATE utf8_general_ci;') &&
            Db::getInstance()->execute('
			 CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'linksmenutop_lang` (
			`id_linksmenutop` INT(11) UNSIGNED NOT NULL,
			`id_lang` INT(11) UNSIGNED NOT NULL,
			`id_shop` INT(11) UNSIGNED NOT NULL,
			`label` VARCHAR( 128 ) NOT NULL ,
			`link` VARCHAR( 128 ) NOT NULL ,
			INDEX ( `id_linksmenutop` , `id_lang`, `id_shop`)
		) ENGINE = '._MYSQL_ENGINE_.' CHARACTER SET utf8 COLLATE utf8_general_ci;')"
modules/ps_mainmenu/ps_mainmenu.php:148:9:type="execute", query="'DROP TABLE `'._DB_PREFIX_.'linksmenutop`'"
modules/ps_mainmenu/ps_mainmenu.php:149:9:type="execute", query="'DROP TABLE `'._DB_PREFIX_.'linksmenutop_lang`'"
modules/ps_mainmenu/ps_mainmenu.php:824:20:type="executeS", query="$sql"
modules/ps_mainmenu/ps_mainmenu.php:835:24:type="executeS", query="$sql"
modules/ps_mainmenu/ps_mainmenu.php:871:16:type="executeS", query="$sql"
modules/ps_mainmenu/ps_mainmenu.php:996:25:type="executeS", query="'
			SELECT *
			FROM '._DB_PREFIX_.'linksmenutop
			WHERE id_shop = '.(int)$params['old_id_shop']
            "
modules/ps_mainmenu/ps_mainmenu.php:1003:13:type="execute", query="'
				INSERT IGNORE INTO '._DB_PREFIX_.'linksmenutop (id_linksmenutop, id_shop, new_window)
				VALUES (null, '.(int)$params['new_id_shop'].', '.(int)$link['new_window'].')'"
modules/ps_mainmenu/ps_mainmenu.php:1007:57:type="Insert_ID", query=""
modules/ps_mainmenu/ps_mainmenu.php:1011:21:type="executeS", query="'
					SELECT id_lang, '.(int)$params['new_id_shop'].', label, link
					FROM '._DB_PREFIX_.'linksmenutop_lang
					WHERE id_linksmenutop = '.(int)$link['id_linksmenutop'].' AND id_shop = '.(int)$params['old_id_shop']"
modules/ps_mainmenu/ps_mainmenu.php:1017:17:type="execute", query="'
					INSERT IGNORE INTO '._DB_PREFIX_.'linksmenutop_lang (id_linksmenutop, id_lang, id_shop, label, link)
					VALUES ('.(int)$link['new_id_linksmenutop'].', '.(int)$l['id_lang'].', '.(int)$params['new_id_shop'].', '.(int)$l['label'].', '.(int)$l['link'].' )'"
modules/ps_mainmenu/ps_mainmenu.php:1272:23:type="executeS", query="'
							SELECT c.*, cl.*
				FROM `'._DB_PREFIX_.'category` c
				INNER JOIN `'._DB_PREFIX_.'category_shop` category_shop ON (category_shop.`id_category` = c.`id_category` AND category_shop.`id_shop` = "'.(int)$shop_id.'")
				LEFT JOIN `'._DB_PREFIX_.'category_lang` cl ON (c.`id_category` = cl.`id_category` AND cl.`id_shop` = "'.(int)$shop_id.'")
				WHERE 1 '.$sql_filter.' '.($id_lang ? 'AND cl.`id_lang` = '.(int)$id_lang : '').'
				'.($active ? ' AND (c.`active` = 1 OR c.`is_root_category` = 1)' : '').'
				'.(isset($groups) && Group::isFeatureActive() ? ' AND cg.`id_group` IN ('.implode(',', $groups).')' : '').'
				'.(!$id_lang || (isset($groups) && Group::isFeatureActive()) ? ' GROUP BY c.`id_category`' : '').'
				'.($sql_sort != '' ? $sql_sort : ' ORDER BY c.`level_depth` ASC').'
				'.($sql_sort == '' && $use_shop_restriction ? ', category_shop.`position` ASC' : '').'
				'.($sql_limit != '' ? $sql_limit : '')
            "
modules/ps_imageslider/ps_imageslider.php:182:22:type="execute", query="'
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'homeslider` (
                `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `id_shop` int(10) unsigned NOT NULL,
                PRIMARY KEY (`id_homeslider_slides`, `id_shop`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;
        '"
modules/ps_imageslider/ps_imageslider.php:191:17:type="execute", query="'
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'homeslider_slides` (
              `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
              `position` int(10) unsigned NOT NULL DEFAULT \'0\',
              `active` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
              PRIMARY KEY (`id_homeslider_slides`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;
        '"
modules/ps_imageslider/ps_imageslider.php:201:17:type="execute", query="'
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'homeslider_slides_lang` (
              `id_homeslider_slides` int(10) unsigned NOT NULL,
              `id_lang` int(10) unsigned NOT NULL,
              `title` varchar(255) NOT NULL,
              `description` text NOT NULL,
              `legend` varchar(255) NOT NULL,
              `url` varchar(255) NOT NULL,
              `image` varchar(255) NOT NULL,
              PRIMARY KEY (`id_homeslider_slides`,`id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;
        '"
modules/ps_imageslider/ps_imageslider.php:228:16:type="execute", query="'
            DROP TABLE IF EXISTS `'._DB_PREFIX_.'homeslider`, `'._DB_PREFIX_.'homeslider_slides`, `'._DB_PREFIX_.'homeslider_slides_lang`;
        '"
modules/ps_imageslider/ps_imageslider.php:585:9:type="execute", query="'
            INSERT IGNORE INTO '._DB_PREFIX_.'homeslider (id_homeslider_slides, id_shop)
            SELECT id_homeslider_slides, '.(int)$params['new_id_shop'].'
            FROM '._DB_PREFIX_.'homeslider
            WHERE id_shop = '.(int)$params['old_id_shop']
        "
modules/dashactivity/dashactivity.php:210:27:type="NumRows", query=""
modules/dashactivity/dashactivity.php:379:23:type="ExecuteS", query="'
				SELECT http_referer
				FROM '._DB_PREFIX_.'connections
				WHERE date_add BETWEEN "'.pSQL($date_from).'" AND "'.pSQL($date_to).'"
				'.Shop::addSqlRestriction().'
				LIMIT '.(int)$limit
            "
modules/gamification/upgrade/install-1.6.6.php:33:12:type="execute", query="'ALTER TABLE `'._DB_PREFIX_.'advice` ADD `start_day` INT NULL DEFAULT 0 , ADD `stop_day` INT NULL DEFAULT 0'"
modules/gamification/upgrade/install-1.7.3.php:33:12:type="execute", query="'ALTER TABLE `'._DB_PREFIX_.'advice` ADD `hide` TINYINT NOT NULL DEFAULT \'0\' AFTER `validated`'"
modules/gamification/upgrade/install-1.7.7.php:40:16:type="executeS", query="'SHOW COLUMNS FROM `'._DB_PREFIX_.'advice` '"
modules/gamification/upgrade/install-1.7.7.php:50:17:type="execute", query="$co['sql']"
modules/gamification/upgrade/install-1.7.7.php:53:13:type="execute", query="$co['sql']"
modules/gamification/upgrade/install-1.4.9.php:33:12:type="execute", query="
        'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'tab_advice` (
          `id_tab` int(11) NOT NULL,
          `id_advice` int(11) NOT NULL,
          PRIMARY KEY (`id_tab`, `id_advice`)
        ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;'
    "
modules/gamification/upgrade/install-1.8.9.php:33:5:type="execute", query="'ALTER TABLE  `'._DB_PREFIX_.'advice` ADD  `weight` INT NULL DEFAULT  \'1\''"
modules/gamification/upgrade/install-1.8.9.php:34:5:type="execute", query="'ALTER TABLE  `'._DB_PREFIX_.'badge` ADD  `awb` INT NULL DEFAULT  \'0\''"
```

## Goals
- create terminal ui for validating safe sql statements
- create a hash for each matching result
- validate only not moderated sql statements
- ablility to scroll the file if the sql statement is a variable
- create a config file for loading scanning options
- generate a csv, json output from the results

## References
- https://github.com/gizak/termui
- https://github.com/jroimartin/gocui 
-	https://github.com/xxjwxc/public/tree/master/myclipboard
- https://github.com/xxjwxc/public/tree/master/mycui
- https://github.com/jinzhu/configor
- https://github.com/agrison/go-tablib
- https://github.com/go-gorm/gorm

## Examples of TUI
![alt text](https://raw.githubusercontent.com/xxjwxc/gormt/master/image/gormt/ui_en.gif "gormt cui")
![alt text](https://raw.githubusercontent.com/asciimoo/wuzz/master/docs/images/screencast.gif "wuzz tui")
