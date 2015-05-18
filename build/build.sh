# opencart theme: fashionist

# clean up
rm -rf fashionist-full-package fashionist-full-package.zip fashionist-theme-package fashionist-theme-package.zip

# export code from local repository
svn --ignore-externals export ../ fashionist-full-package/ --username lam.le

# copy database default files
cat fashionist-full-package/db/1_schema.sql fashionist-full-package/db/2_init_data.sql fashionist-full-package/db/3_update_config.sql > sample-database.sql

# create fashionist-theme-package.zip
mkdir fashionist-theme-package \
	fashionist-theme-package/upload \
	fashionist-theme-package/extensions \
	fashionist-theme-package/upload/admin \
	fashionist-theme-package/upload/admin/controller \
	fashionist-theme-package/upload/admin/controller/module \
	fashionist-theme-package/upload/admin/view \
	fashionist-theme-package/upload/admin/view/image \
	fashionist-theme-package/upload/admin/view/stylesheet \
	fashionist-theme-package/upload/admin/view/javascript \
	fashionist-theme-package/upload/admin/view/template \
	fashionist-theme-package/upload/admin/view/template/module \
	fashionist-theme-package/upload/admin/language \
	fashionist-theme-package/upload/admin/language/english \
	fashionist-theme-package/upload/admin/language/english/module \
	fashionist-theme-package/upload/admin/model \
	fashionist-theme-package/upload/admin/model/module \
	fashionist-theme-package/upload/catalog \
	fashionist-theme-package/upload/catalog/controller \
	fashionist-theme-package/upload/catalog/controller/module \
	fashionist-theme-package/upload/catalog/language \
	fashionist-theme-package/upload/catalog/language/english \
	fashionist-theme-package/upload/catalog/language/english/module \
	fashionist-theme-package/upload/catalog/model \
	fashionist-theme-package/upload/catalog/model/account \
	fashionist-theme-package/upload/catalog/model/module \
	fashionist-theme-package/upload/catalog/view \
	fashionist-theme-package/upload/catalog/view/theme \
	fashionist-theme-package/upload/catalog/view/javascript \
	fashionist-theme-package/upload/catalog/view/theme/default \
	fashionist-theme-package/upload/catalog/view/theme/default/template \
	fashionist-theme-package/upload/catalog/view/theme/default/template/module \
	fashionist-theme-package/upload/catalog/view/theme/default/template/twitteroauth \
	fashionist-theme-package/upload/catalog/view/theme/default/stylesheet \
	fashionist-theme-package/upload/catalog/view/theme/default/image \
	fashionist-theme-package/upload/image \
	fashionist-theme-package/upload/image/catalog \
	fashionist-theme-package/upload/image/templates \
	fashionist-theme-package/upload/system \
	fashionist-theme-package/upload/system/library \

# fashionist-theme-package/upload/admin/controller
cp -r fashionist-full-package/admin/controller/bossblog fashionist-theme-package/upload/admin/controller
cp -r fashionist-full-package/admin/controller/bossthemes fashionist-theme-package/upload/admin/controller

# fashionist-theme-package/upload/admin/controller/module/
cp fashionist-full-package/admin/controller/module/blogcategory.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/blogrecentcomment.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/blogrecentpost.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/blogsearch.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/blogtagcloud.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_alphabet.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_blogfeatured.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_category.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_featured.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_filterproduct.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_manager.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_manufacturer.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_newmegamenu.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_quickshop.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_revolutionslider.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_tagcloud.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/boss_zoom.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/bossblog.php  fashionist-theme-package/upload/admin/controller/module
cp fashionist-full-package/admin/controller/module/xoc_twitterupdate.php  fashionist-theme-package/upload/admin/controller/module

# fashionist-theme-package/upload/admin/language/english
cp -r fashionist-full-package/admin/language/english/bossblog fashionist-theme-package/upload/admin/language/english

# fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/blogcategory.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/blogrecentcomment.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/blogrecentpost.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/blogsearch.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/blogtagcloud.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_alphabet.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_blogfeatured.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_category.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_featured.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_filterproduct.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_manager.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_manufacturer.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_newmegamenu.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_quickshop.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_revolutionslider.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_tagcloud.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/boss_zoom.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/bossblog.php  fashionist-theme-package/upload/admin/language/english/module
cp fashionist-full-package/admin/language/english/module/xoc_twitterupdate.php  fashionist-theme-package/upload/admin/language/english/module

# fashionist-theme-package/upload/admin/model
cp -r fashionist-full-package/admin/model/bossblog fashionist-theme-package/upload/admin/model
cp -r fashionist-full-package/admin/model/bossthemes fashionist-theme-package/upload/admin/model

# fashionist-theme-package/upload/admin/view/font
cp -r fashionist-full-package/admin/view/font fashionist-theme-package/upload/admin/view

# fashionist-theme-package/upload/admin/view/image
cp -r fashionist-full-package/admin/view/image/bossthemes fashionist-theme-package/upload/admin/view/image

# fashionist-theme-package/upload/admin/view/javascript
cp -r fashionist-full-package/admin/view/javascript/bossthemes fashionist-theme-package/upload/admin/view/javascript

# fashionist-theme-package/upload/admin/view/stylesheet
cp -r fashionist-full-package/admin/view/stylesheet/bossthemes fashionist-theme-package/upload/admin/view/stylesheet

# fashionist-theme-package/upload/admin/vi/template
cp -r fashionist-full-package/admin/view/template/bossblog fashionist-theme-package/upload/admin/view/template
	
# fashionist-theme-package/upload/admin/view/template/module
cp -r fashionist-full-package/admin/view/template/module/boss_revolutionslider fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/blogcategory.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/blogrecentcomment.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/blogrecentpost.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/blogsearch.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/blogtagcloud.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_alphabet.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_blogfeatured.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_category.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_changetemplate.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_featured.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_filterproduct.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_manager.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_manufacturer.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_newmegamenu.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_newmegamenu_addcolumn.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_newmegamenu_addmenu.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_newmegamenu_addrow.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_quickshop.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_tagcloud.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/boss_zoom.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/bossblog.tpl  fashionist-theme-package/upload/admin/view/template/module
cp fashionist-full-package/admin/view/template/module/xoc_twitterupdate.tpl  fashionist-theme-package/upload/admin/view/template/module


# fashionist-theme-package/upload/catalog/controller
cp -r fashionist-full-package/catalog/controller/bossthemes fashionist-theme-package/upload/catalog/controller
cp -r fashionist-full-package/catalog/controller/bossblog fashionist-theme-package/upload/catalog/controller

# fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/blogcategory.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/blogrecentcomment.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/blogrecentpost.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/blogsearch.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/blogtagcloud.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_alphabet.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_blogfeatured.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_category.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_featured.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_filterproduct.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_manager.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_manufacturer.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_newmegamenu.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_quick_shop_product.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_quickshop.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_revolutionslider.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_tagcloud.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/boss_zoom.php fashionist-theme-package/upload/catalog/controller/module
cp fashionist-full-package/catalog/controller/module/xoc_twitterupdate.php fashionist-theme-package/upload/catalog/controller/module


# fashionist-theme-package/upload/catalog/language/english
cp -r fashionist-full-package/catalog/language/english/bossthemes fashionist-theme-package/upload/catalog/language/english
cp -r fashionist-full-package/catalog/language/english/bossblog fashionist-theme-package/upload/catalog/language/english

# fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/blogcategory.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/blogrecentcomment.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/blogrecentpost.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/blogsearch.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/blogtagcloud.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/boss_blogfeatured.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/boss_manufacturer.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/boss_newmegamenu.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/boss_quick_shop_product.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/boss_tagcloud.php fashionist-theme-package/upload/catalog/language/english/module
cp fashionist-full-package/catalog/language/english/module/boss_zoom.php fashionist-theme-package/upload/catalog/language/english/module

# fashionist-theme-package/upload/catalog/model/
cp -r fashionist-full-package/catalog/model/bossblog fashionist-theme-package/upload/catalog/model
cp -r fashionist-full-package/catalog/model/bossthemes fashionist-theme-package/upload/catalog/model

# fashionist-theme-package/upload/catalog/view/javascript 
cp -r fashionist-full-package/catalog/view/javascript/bossthemes fashionist-theme-package/upload/catalog/view/javascript

# fashionist-theme-package/upload/catalog/view/theme/default/stylesheet
cp -r fashionist-full-package/catalog/view/theme/default/stylesheet/bossthemes fashionist-theme-package/upload/catalog/view/theme/default/stylesheet

# fashionist-theme-package/upload/catalog/view/theme/default/template/
cp -r fashionist-full-package/catalog/view/theme/default/template/bossthemes fashionist-theme-package/upload/catalog/view/theme/default/template
cp -r fashionist-full-package/catalog/view/theme/default/template/bossblog fashionist-theme-package/upload/catalog/view/theme/default/template
cp -r fashionist-full-package/catalog/view/theme/default/template/twitteroauth fashionist-theme-package/upload/catalog/view/theme/default/template


# fashionist-theme-package/upload/catalog/view/theme/default/template/module/
cp fashionist-full-package/catalog/view/theme/default/template/module/blogcategory.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/blogrecentcomment.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/blogrecentpost.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/blogsearch.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/blogtagcloud.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_alphabet.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_blogfeatured.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_category.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_featured.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_filterproduct.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_manager.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_manufacturer.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_newmegamenu.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_quick_shop_product.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_quickshop.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_revolutionslider.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_tagcloud.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/boss_zoom.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module
cp fashionist-full-package/catalog/view/theme/default/template/module/xoc_twitterupdate.tpl fashionist-theme-package/upload/catalog/view/theme/default/template/module

# fashionist-theme-package/upload/catalog/view/theme/bt_fashionist
cp -r fashionist-full-package/catalog/view/theme/bt_fashionist fashionist-theme-package/upload/catalog/view/theme

# fashionist-theme-package/upload/config_xml- modification_xml
cp -r fashionist-full-package/config_xml fashionist-theme-package/upload
cp -r fashionist-full-package/modification_xml fashionist-theme-package/upload

# fashionist-theme-package/upload/image 
cp -r fashionist-full-package/image/catalog/bt_fashionist fashionist-theme-package/upload/image/catalog
cp -r fashionist-full-package/image/catalog/bossblog fashionist-theme-package/upload/image/catalog
cp -r fashionist-full-package/image/catalog/bt_product fashionist-theme-package/upload/image/catalog
cp fashionist-full-package/image/templates/bt_fashionist.png  fashionist-theme-package/upload/image/templates

# fashionist-theme-package/upload/system /library
cp fashionist-full-package/system/library/btform.php  fashionist-theme-package/upload/system/library

# remove non-disclosed files
rm -Rf fashionist-full-package/db/ \
fashionist-full-package/build/ \
fashionist-full-package/_demo/ \
fashionist-full-package/demo.html \


# create fashionist-full-package.zip
zip -rq fashionist-full-package.zip fashionist-full-package/ sample-database.sql

echo "Created fashionist-full-package.zip"

# create fashionist-theme-package.zip
zip -rq fashionist-theme-package.zip fashionist-theme-package
echo "Created fashionist-theme-package.zip"

#clean up
rm -Rf fashionist-theme-package
rm -Rf fashionist-full-package
rm -Rf sample-database.sql
