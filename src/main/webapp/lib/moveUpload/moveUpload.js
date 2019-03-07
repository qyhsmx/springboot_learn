/*
 *	jQuery图片上传左右移动插件;
 *	@Author BrianZhou;
 */
(function( $ ) {

  $.fn.extend({
    moveUpload: function (options) {
      if ( typeof options != "object" ) {
        alert('参数错误!');
        return;
      }

      var defaults = {
        nub: 4,               //默认显示几条-可以不要根据value的条数
        value: [],             //name必选，SRC为空的时候使用默认图片展示地址, 有就顺序
        hasUrl: true
      };
      var $that = $(this);
      var settings = $.extend(defaults, options);

      var warpUl = '';
      var liGroup = '';
      var defaultImg = './lib/moveUpload/images/upload-bj.png';
      if( settings.num!=0 ){
        $.each(settings.value,function(key){
          settings.value[key].src = settings.value[key].src || defaultImg;
          if(settings.hasUrl){
            liGroup += '<li class="uploadHover"><div class="view-img"><input type="file" name="'+settings.value[key].name+'" value="" style="display:none"><p class="control"><span class="diyLeft"><i></i></span><span class="diyCancel"><i></i></span><span class="diyRight"><i></i></span></p><img src="'+settings.value[key].src+'" alt="" /></div><div class="banner-url"><label>URL地址:</label><input type="text" name="" class="layui-input" value="'+settings.value[key].url+'"></div></li>';
          }else{
            liGroup += '<li class="uploadHover"><div class="view-img"><input type="file" name="'+settings.value[key].name+'" value="" style="display:none"><p class="control"><span class="diyLeft"><i></i></span><span class="diyCancel"><i></i></span><span class="diyRight"><i></i></span></p><img src="'+settings.value[key].src+'" alt="" /></div></li>';
          }
        });
        warpUl = '<ul class="upload-box">'+liGroup+'</ul>';
        $that.append(warpUl);
      }

      //img绑定click触发隐藏input[file]的标签
      $that.find('li img').on('click', function(){
        $(this).siblings('input').click();
      })

      $that.find('li .view-img input').on('change', function(){
        var obgImg = $(this).siblings('img');
        //console.log($(this).prop('files')[0]);
        upload($(this).prop('files'), obgImg);
      })

      //绑定取消事件
      $that.find('li .diyCancel').on('click', function(){
        removeLi($(this));
      })

      //绑定左移事件
      $that.find('li .diyLeft').on('click', function(){
        leftLi($(this).parents('.uploadHover').prev(), $(this).parents('.uploadHover'));
      })

      //绑定右移事件
      $that.find('li .diyRight').on('click',function(){
        rightLi($(this).parents('.uploadHover').next(), $(this).parents('.uploadHover') );
      });

      //img绑定click触发隐藏input[file]的标签
      function upload(f,objImg){
        var str = "";
        for(var i=0;i<f.length;i++){
          var reader = new FileReader();
          reader.readAsDataURL(f[i]);
          reader.onload = function(e){
            objImg.attr("src", e.target.result );
          }
        }
      }

      //取消事件;
      function removeLi ( $li ) {
        $li.parents('.control').siblings('img').attr("src", defaultImg );
        $li.parents('.control').siblings('input').val('');
      }

      //左移事件;
      function leftLi ($leftli, $li) {
        $li.insertBefore($leftli);
      }

      //右移事件;
      function rightLi ($rightli, $li) {
        $li.insertAfter($rightli);
      }

      //listData方法
      this.getListData = function () {
        var list = [];
        var formData = new FormData();
        $.each(settings.value,function(key){
          formData.append(settings.value[key].name, $('#box').find('li input[name="'+settings.value[key].name+'"]').prop('files')[0]);
        });
        var liGroup = $that.find('.upload-box li');
        for (var i = 0; i < liGroup.length; i++) {
          var liObj = {};
          liObj.name = $(liGroup[i]).find('.view-img input').prop('name');
          liObj.sort = i;
          if(settings.hasUrl){
            liObj.url = $(liGroup[i]).find('.banner-url input').val();
          }
          list.push(liObj);
        }
        formData.append('list',JSON.stringify(list));
        return formData
      };
      return this
    }

  });
})( jQuery );
