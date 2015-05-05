<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="cancion" class="com.bailen.radioOnline.Cancion" scope="request" />
<!DOCTYPE html>
<html>
  <head>
    <title>identificado</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/identificado/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/axure/axQuery.js"></script>
    <script src="resources/scripts/axure/globals.js"></script>
    <script src="resources/scripts/axutils.js"></script>
    <script src="resources/scripts/axure/annotation.js"></script>
    <script src="resources/scripts/axure/axQuery.std.js"></script>
    <script src="resources/scripts/axure/doc.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/messagecenter.js"></script>
    <script src="resources/scripts/axure/events.js"></script>
    <script src="resources/scripts/axure/action.js"></script>
    <script src="resources/scripts/axure/expr.js"></script>
    <script src="resources/scripts/axure/geometry.js"></script>
    <script src="resources/scripts/axure/flyout.js"></script>
    <script src="resources/scripts/axure/ie.js"></script>
    <script src="resources/scripts/axure/model.js"></script>
    <script src="resources/scripts/axure/repeater.js"></script>
    <script src="resources/scripts/axure/sto.js"></script>
    <script src="resources/scripts/axure/utils.temp.js"></script>
    <script src="resources/scripts/axure/variables.js"></script>
    <script src="resources/scripts/axure/drag.js"></script>
    <script src="resources/scripts/axure/move.js"></script>
    <script src="resources/scripts/axure/visibility.js"></script>
    <script src="resources/scripts/axure/style.js"></script>
    <script src="resources/scripts/axure/adaptive.js"></script>
    <script src="resources/scripts/axure/tree.js"></script>
    <script src="resources/scripts/axure/init.temp.js"></script>
    <script src="files/identificado/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
    <script type="text/javascript">
        // Global variable to track current file name.
        var currentFile = "";
        function playAudio() {
            // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    
                    

                    //Skip loading if current file hasn't changed.
                    /*if (audioURL.value !== currentFile) {
                        oAudio.src = audioURL.value;
                        currentFile = audioURL.value;                       
                    }*/

                    // Tests the paused attribute and set state. 
                    
                    oAudio.play();
                        
                    
                   
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
                }
            }
        }
        
        function playAudioInicio() {
            // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    
                    var imagenlist1=document.getElementById("u122_img");
                    var imagenlist2=document.getElementById("u124_img");
                    var imagenlist3=document.getElementById("u126_img");
                    var imagenlist4=document.getElementById("u128_img");
                    
                    //texto lista
                var spa1=document.getElementById("spa1");
                var spa2=document.getElementById("spa2");
                var spa3=document.getElementById("spa3");
                var spa4=document.getElementById("spa4");

                    //Skip loading if current file hasn't changed.
                    /*if (audioURL.value !== currentFile) {
                        oAudio.src = audioURL.value;
                        currentFile = audioURL.value;                       
                    }*/

                    // Tests the paused attribute and set state. 
                    
                    oAudio.play();
                        
                    //imagenes lista reproduccion    
                    imagenlist1.src= $('#playlist').children().eq(1).attr('imagen');
                    imagenlist2.src= $('#playlist').children().eq(2).attr('imagen');
                    imagenlist3.src= $('#playlist').children().eq(3).attr('imagen');
                    imagenlist4.src= $('#playlist').children().eq(4).attr('imagen');
                    
                    //texto lista reproduccion
               spa1.firstChild.nodeValue= $('#playlist').children().eq(1).attr('texto');
               spa2.firstChild.nodeValue= $('#playlist').children().eq(2).attr('texto');
               spa3.firstChild.nodeValue= $('#playlist').children().eq(3).attr('texto');
               spa4.firstChild.nodeValue= $('#playlist').children().eq(4).attr('texto');
               
                    
                   
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
                }
            }
        }


        function pauseAudio() {
            // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    var btn = document.getElementById('u8_img'); 
                    var audioURL = document.getElementById('audiofile'); 

                    //Skip loading if current file hasn't changed.
                    /*if (audioURL.value !== currentFile) {
                        oAudio.src = audioURL.value;
                        currentFile = audioURL.value;                       
                    }*/

                    // Tests the paused attribute and set state. 
                        
                        oAudio.pause();
                        
                    
                   
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
                }
            }
        }
        
        $(function(){
            var iCancionActual=0;
            var iTotalCanciones=$('#playlist li').length;
            var objReproductor=document.getElementById('myaudio');
            
            
            $(objReproductor).on('ended',function(){
               var objReproductor=document.getElementById('myaudio');
               var imagenRep=document.getElementById("u17_img");
               var textoRep=document.getElementById('textoRep');
               
               //lista reproducción
                var imagenlist1=document.getElementById("u122_img");
                var imagenlist2=document.getElementById("u124_img");
                var imagenlist3=document.getElementById("u126_img");
                var imagenlist4=document.getElementById("u128_img");
                //texto lista
                var spa1=document.getElementById("spa1");
                var spa2=document.getElementById("spa2");
                var spa3=document.getElementById("spa3");
                var spa4=document.getElementById("spa4");
                
               
               
               if(iCancionActual===iTotalCanciones-1){
                    iCancionActual=0; 
               }else{
                   iCancionActual++;      
               }
               
                              
               objReproductor.src=$('#playlist').children().eq(iCancionActual).attr('rel');
               imagenRep.src= $('#playlist').children().eq(iCancionActual).attr('imagen');
               textoRep.firstChild.nodeValue = $('#playlist').children().eq(iCancionActual).attr('texto');
               objReproductor.play();
               
               //imagenes lista reproduccion
               imagenlist1.src= $('#playlist').children().eq((iCancionActual+1)%10).attr('imagen');
               imagenlist2.src= $('#playlist').children().eq((iCancionActual+2)%10).attr('imagen');
               imagenlist3.src= $('#playlist').children().eq((iCancionActual+3)%10).attr('imagen');
               imagenlist4.src= $('#playlist').children().eq((iCancionActual+4)%10).attr('imagen');
               //texto lista reproduccion
               spa1.firstChild.nodeValue= $('#playlist').children().eq((iCancionActual+1)%10).attr('texto');
               spa2.firstChild.nodeValue= $('#playlist').children().eq((iCancionActual+2)%10).attr('texto');
               spa3.firstChild.nodeValue= $('#playlist').children().eq((iCancionActual+3)%10).attr('texto');
               spa4.firstChild.nodeValue= $('#playlist').children().eq((iCancionActual+4)%10).attr('texto');
               
            });
        });
    </script>
  </head>
  <body onload="playAudioInicio()">

<table>
  <tr>
    <td style="width: 10px;">
      <div style="width: 157px;"></div>
    </td>
    <td>

    <div id="base" class="">

      <!-- Unnamed (Image) -->
      <div id="u0" class="ax_image">
        <img id="u0_img" class="img " src="images/identificado/u0.png"/>
        <!-- Unnamed () -->
        <div id="u1" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u2" class="ax_image">
        <img id="u2_img" class="img " src="images/identificado/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u4" class="ax_image">
        <img id="u4_img" class="img " src="images/sin_identificar/u4.png"/>
        <!-- Unnamed () -->
        <div id="u5" class="text">
          <p><span></span></p>
        </div>
      </div>

      <audio id="myaudio" src="${canciones[0].audio}" >HTML5 audio not supported</audio>
         
         <!--playlist-->
         <ul type="hidden" id="playlist"><c:forEach items="${canciones}" var="canc">
             <li rel="${canc.audio}" imagen="${canc.image}" texto="${canc.name} (${canc.artist_name})"></li>
             </c:forEach></ul>
      <!-- Unnamed (Image) -->
      <div id="u6" class="ax_image">
        <img id="u6_img" class="img " onclick="playAudio();" src="images/sin_identificar/u6.png"/>
        <!-- Unnamed () -->
        <div id="u7" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u8" class="ax_image">
        <img id="u8_img" class="img " onclick="pauseAudio();" src="images/sin_identificar/u8.png"/>
        <!-- Unnamed () -->
        <div id="u9" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Dynamic Panel) -->
      <div id="u10" class="ax_dynamic_panel">
        <div id="u10_state0" class="panel_state" data-label="State1">
          <div id="u10_state0_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u11" class="ax_image">
              <img id="u11_img" class="img " src="images/sin_identificar/u11.gif"/>
              <!-- Unnamed () -->
              <div id="u12" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u10_state1" class="panel_state" data-label="State2">
          <div id="u10_state1_content" class="panel_state_content">

            <!-- Unnamed (Shape) -->
            <div id="u13" class="ax_shape">
              <img id="u13_img" class="img " src="images/sin_identificar/u13.png"/>
              <!-- Unnamed () -->
              <div id="u14" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u15" class="ax_paragraph">
        <img id="u15_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u16" class="text">
          <p><span>Sonando</span><span>: Si pero No (David Bisbal)</span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u17" class="ax_image">
        <img id="u17_img" class="img " src="images/sin_identificar/u17.jpg"/>
        <!-- Unnamed () -->
        <div id="u18" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u19" class="ax_image">
        <img id="u19_img" class="img " src="images/sin_identificar/u19.png"/>
        <!-- Unnamed () -->
        <div id="u20" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u21" class="ax_image">
        <img id="u21_img" class="img " src="images/sin_identificar/u21.png"/>
        <!-- Unnamed () -->
        <div id="u22" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- carrusel artistas (Dynamic Panel) -->
      <div id="u23" class="ax_dynamic_panel" data-label="carrusel artistas">
        <div id="u23_state0" class="panel_state" data-label="State1">
          <div id="u23_state0_content" class="panel_state_content">

            <!-- Unnamed (Shape) -->
            <div id="u24" class="ax_shape">
              <img id="u24_img" class="img " src="images/sin_identificar/u24.png"/>
              <!-- Unnamed () -->
              <div id="u25" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u26" class="ax_image">
              <img id="u26_img" class="img " src="images/sin_identificar/u26.jpg"/>
              <!-- Unnamed () -->
              <div id="u27" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u28" class="ax_shape">
              <img id="u28_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u29" class="text">
                <p><span>A</span><span>riana Grande</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u23_state1" class="panel_state" data-label="State2">
          <div id="u23_state1_content" class="panel_state_content">

            <!-- Unnamed (Shape) -->
            <div id="u30" class="ax_shape">
              <img id="u30_img" class="img " src="images/sin_identificar/u24.png"/>
              <!-- Unnamed () -->
              <div id="u31" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u32" class="ax_image">
              <img id="u32_img" class="img " src="images/sin_identificar/u32.jpg"/>
              <!-- Unnamed () -->
              <div id="u33" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u34" class="ax_shape">
              <img id="u34_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u35" class="text">
                <p><span>D</span><span>avid Bisbal</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u23_state2" class="panel_state" data-label="State3">
          <div id="u23_state2_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u36" class="ax_image">
              <img id="u36_img" class="img " src="images/sin_identificar/u36.jpg"/>
              <!-- Unnamed () -->
              <div id="u37" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u38" class="ax_shape">
              <img id="u38_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u39" class="text">
                <p><span>M</span><span>iguel Bosé</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u23_state3" class="panel_state" data-label="State4">
          <div id="u23_state3_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u40" class="ax_image">
              <img id="u40_img" class="img " src="images/sin_identificar/u40.jpg"/>
              <!-- Unnamed () -->
              <div id="u41" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u42" class="ax_shape">
              <img id="u42_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u43" class="text">
                <p><span>Riahanna</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u23_state4" class="panel_state" data-label="State5">
          <div id="u23_state4_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u44" class="ax_image">
              <img id="u44_img" class="img " src="images/sin_identificar/u44.jpeg"/>
              <!-- Unnamed () -->
              <div id="u45" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u46" class="ax_shape">
              <img id="u46_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u47" class="text">
                <p><span>P</span><span>harrell Williams</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u23_state5" class="panel_state" data-label="State6">
          <div id="u23_state5_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u48" class="ax_image">
              <img id="u48_img" class="img " src="images/sin_identificar/u48.jpg"/>
              <!-- Unnamed () -->
              <div id="u49" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u50" class="ax_shape">
              <img id="u50_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u51" class="text">
                <p><span>B</span><span>irdy</span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u52" class="ax_shape">
        <img id="u52_img" class="img " src="images/sin_identificar/u24.png"/>
        <!-- Unnamed () -->
        <div id="u53" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u54" class="ax_h2">
        <img id="u54_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u55" class="text">
          <p><span>Artistas favoritos </span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u56" class="ax_h2">
        <img id="u56_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u57" class="text">
          <p><span>Temas + valorados</span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u58" class="ax_image">
        <img id="u58_img" class="img " src="images/sin_identificar/u58.gif"/>
        <!-- Unnamed () -->
        <div id="u59" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u60" class="ax_image">
        <img id="u60_img" class="img " src="images/sin_identificar/u60.PNG"/>
        <!-- Unnamed () -->
        <div id="u61" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u62" class="ax_paragraph">
        <img id="u62_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u63" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- estado (Dynamic Panel) -->
      <div id="u64" class="ax_dynamic_panel" data-label="estado">
        <div id="u64_state0" class="panel_state" data-label="State1">
          <div id="u64_state0_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u65" class="ax_image">
              <img id="u65_img" class="img " src="images/sin_identificar/u65.png"/>
              <!-- Unnamed () -->
              <div id="u66" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u64_state1" class="panel_state" data-label="State2">
          <div id="u64_state1_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u67" class="ax_image">
              <img id="u67_img" class="img " src="images/sin_identificar/u67.png"/>
              <!-- Unnamed () -->
              <div id="u68" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u64_state2" class="panel_state" data-label="State3">
          <div id="u64_state2_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u69" class="ax_image">
              <img id="u69_img" class="img " src="images/sin_identificar/u69.png"/>
              <!-- Unnamed () -->
              <div id="u70" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u64_state3" class="panel_state" data-label="State4">
          <div id="u64_state3_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u71" class="ax_image">
              <img id="u71_img" class="img " src="images/sin_identificar/u71.png"/>
              <!-- Unnamed () -->
              <div id="u72" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u64_state4" class="panel_state" data-label="State5">
          <div id="u64_state4_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u73" class="ax_image">
              <img id="u73_img" class="img " src="images/sin_identificar/u73.png"/>
              <!-- Unnamed () -->
              <div id="u74" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u64_state5" class="panel_state" data-label="State6">
          <div id="u64_state5_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u75" class="ax_image">
              <img id="u75_img" class="img " src="images/sin_identificar/u75.png"/>
              <!-- Unnamed () -->
              <div id="u76" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- estado canciones (Dynamic Panel) -->
      <div id="u77" class="ax_dynamic_panel" data-label="estado canciones">
        <div id="u77_state0" class="panel_state" data-label="State1">
          <div id="u77_state0_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u78" class="ax_image">
              <img id="u78_img" class="img " src="images/sin_identificar/u65.png"/>
              <!-- Unnamed () -->
              <div id="u79" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u77_state1" class="panel_state" data-label="State2">
          <div id="u77_state1_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u80" class="ax_image">
              <img id="u80_img" class="img " src="images/sin_identificar/u67.png"/>
              <!-- Unnamed () -->
              <div id="u81" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u77_state2" class="panel_state" data-label="State3">
          <div id="u77_state2_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u82" class="ax_image">
              <img id="u82_img" class="img " src="images/sin_identificar/u69.png"/>
              <!-- Unnamed () -->
              <div id="u83" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u77_state3" class="panel_state" data-label="State4">
          <div id="u77_state3_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u84" class="ax_image">
              <img id="u84_img" class="img " src="images/sin_identificar/u71.png"/>
              <!-- Unnamed () -->
              <div id="u85" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u77_state4" class="panel_state" data-label="State5">
          <div id="u77_state4_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u86" class="ax_image">
              <img id="u86_img" class="img " src="images/sin_identificar/u73.png"/>
              <!-- Unnamed () -->
              <div id="u87" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u77_state5" class="panel_state" data-label="State6">
          <div id="u77_state5_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u88" class="ax_image">
              <img id="u88_img" class="img " src="images/sin_identificar/u75.png"/>
              <!-- Unnamed () -->
              <div id="u89" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- carrusel temas (Dynamic Panel) -->
      <div id="u90" class="ax_dynamic_panel" data-label="carrusel temas">
        <div id="u90_state0" class="panel_state" data-label="State1">
          <div id="u90_state0_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u91" class="ax_image">
              <img id="u91_img" class="img " src="images/sin_identificar/u17.jpg"/>
              <!-- Unnamed () -->
              <div id="u92" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u93" class="ax_shape">
              <img id="u93_img" class="img " src="images/sin_identificar/u28.png"/>
              <!-- Unnamed () -->
              <div id="u94" class="text">
                <p><span>S</span><span>i pero No - David Bisbal</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u90_state1" class="panel_state" data-label="State2">
          <div id="u90_state1_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u95" class="ax_image">
              <img id="u95_img" class="img " src="images/sin_identificar/u95.jpg"/>
              <!-- Unnamed () -->
              <div id="u96" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u97" class="ax_shape">
              <img id="u97_img" class="img " src="images/sin_identificar/u97.png"/>
              <!-- Unnamed () -->
              <div id="u98" class="text">
                <p><span>P</span><span>asos de cero - Pablo Alborán</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u90_state2" class="panel_state" data-label="State3">
          <div id="u90_state2_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u99" class="ax_image">
              <img id="u99_img" class="img " src="images/sin_identificar/u99.jpg"/>
              <!-- Unnamed () -->
              <div id="u100" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u101" class="ax_shape">
              <img id="u101_img" class="img " src="images/sin_identificar/u97.png"/>
              <!-- Unnamed () -->
              <div id="u102" class="text">
                <p><span>T</span><span>ocado y hundido - Melendi</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u90_state3" class="panel_state" data-label="State4">
          <div id="u90_state3_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u103" class="ax_image">
              <img id="u103_img" class="img " src="images/sin_identificar/u103.jpg"/>
              <!-- Unnamed () -->
              <div id="u104" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u105" class="ax_shape">
              <img id="u105_img" class="img " src="images/sin_identificar/u97.png"/>
              <!-- Unnamed () -->
              <div id="u106" class="text">
                <p><span>Dangerous - David Guetta</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u90_state4" class="panel_state" data-label="State5">
          <div id="u90_state4_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u107" class="ax_image">
              <img id="u107_img" class="img " src="images/sin_identificar/u107.jpg"/>
              <!-- Unnamed () -->
              <div id="u108" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u109" class="ax_shape">
              <img id="u109_img" class="img " src="images/sin_identificar/u97.png"/>
              <!-- Unnamed () -->
              <div id="u110" class="text">
                <p><span>C</span><span>handelier - Sia</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u90_state5" class="panel_state" data-label="State6">
          <div id="u90_state5_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u111" class="ax_image">
              <img id="u111_img" class="img " src="images/sin_identificar/u111.jpg"/>
              <!-- Unnamed () -->
              <div id="u112" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u113" class="ax_shape">
              <img id="u113_img" class="img " src="images/sin_identificar/u97.png"/>
              <!-- Unnamed () -->
              <div id="u114" class="text">
                <p><span>T</span><span>ake me to church - Hozier</span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u115" class="ax_image">
        <img id="u115_img" class="img " src="images/identificado/u115.gif"/>
        <!-- Unnamed () -->
        <div id="u116" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u117" class="ax_image">
        <img id="u117_img" class="img " src="images/identificado/u117.png"/>
        <!-- Unnamed () -->
        <div id="u118" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- lista/registro (Dynamic Panel) -->
      <div id="u119" class="ax_dynamic_panel" data-label="lista/registro">
        <div id="u119_state0" class="panel_state" data-label="State1">
          <div id="u119_state0_content" class="panel_state_content">

            <!-- Unnamed (Shape) -->
            <div id="u120" class="ax_shape">
              <img id="u120_img" class="img " src="images/sin_identificar/u120.png"/>
              <!-- Unnamed () -->
              <div id="u121" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u122" class="ax_image">
              <img id="u122_img" class="img " src="images/sin_identificar/u99.jpg"/>
              <!-- Unnamed () -->
              <div id="u123" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u124" class="ax_image">
              <img id="u124_img" class="img " src="images/sin_identificar/u17.jpg"/>
              <!-- Unnamed () -->
              <div id="u125" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u126" class="ax_image">
              <img id="u126_img" class="img " src="images/sin_identificar/u95.jpg"/>
              <!-- Unnamed () -->
              <div id="u127" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u128" class="ax_image">
              <img id="u128_img" class="img " src="images/sin_identificar/u128.png"/>
              <!-- Unnamed () -->
              <div id="u129" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u130" class="ax_paragraph">
              <img id="u130_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u131" class="text">
                <p><span>Tocado y hundido (Melendi)</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u132" class="ax_paragraph">
              <img id="u132_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u133" class="text">
                <p><span>Si pero no (David Bisbal)</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u134" class="ax_paragraph">
              <img id="u134_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u135" class="text">
                <p><span>Pasos de cero</span></p><p><span>(Pablo Alboran)</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u136" class="ax_paragraph">
              <img id="u136_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u137" class="text">
                <p style="font-size:16px;"><span style="font-size:16px;">People help the people</span></p><p style="font-size:16px;"><span style="font-size:16px;">(Birdy</span><span style="font-size:13px;">)</span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u119_state1" class="panel_state" data-label="State2">
          <div id="u119_state1_content" class="panel_state_content">

            <!-- Unnamed (Shape) -->
            <div id="u138" class="ax_shape">
              <img id="u138_img" class="img " src="images/identificado/u138.png"/>
              <!-- Unnamed () -->
              <div id="u139" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u140" class="ax_paragraph">
              <img id="u140_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u141" class="text">
                <p><span>Nombre</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u142" class="ax_text_field">
              <input id="u142_input" type="text" value=""/>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u143" class="ax_paragraph">
              <img id="u143_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u144" class="text">
                <p><span>Apellidos</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u145" class="ax_text_field">
              <input id="u145_input" type="text" value=""/>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u146" class="ax_paragraph">
              <img id="u146_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u147" class="text">
                <p><span>Usuario</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u148" class="ax_text_field">
              <input id="u148_input" type="text" value=""/>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u149" class="ax_paragraph">
              <img id="u149_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u150" class="text">
                <p><span>Contraseña</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u151" class="ax_text_field">
              <input id="u151_input" type="text" value=""/>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u152" class="ax_paragraph">
              <img id="u152_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u153" class="text">
                <p><span>E-mail</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u154" class="ax_text_field">
              <input id="u154_input" type="text" value=""/>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u155" class="ax_html_button">
              <input id="u155_input" type="submit" value="Enviar"/>
            </div>
          </div>
        </div>
      </div>

      <!-- Menus (Dynamic Panel) -->
      <div id="u156" class="ax_dynamic_panel" data-label="Menus">
        <div id="u156_state0" class="panel_state" data-label="State2">
          <div id="u156_state0_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u157" class="ax_image">
              <img id="u157_img" class="img " src="images/sin_identificar/u158.png"/>
              <!-- Unnamed () -->
              <div id="u158" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u159" class="ax_html_button">
              <input id="u159_input" type="submit" value="Cancelar"/>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u160" class="ax_image">
              <img id="u160_img" class="img " src="images/identificado/u160.png"/>
              <!-- Unnamed () -->
              <div id="u161" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u162" class="ax_image">
              <img id="u162_img" class="img " src="images/identificado/u162.png"/>
              <!-- Unnamed () -->
              <div id="u163" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u156_state1" class="panel_state" data-label="State1">
          <div id="u156_state1_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u164" class="ax_image">
              <img id="u164_img" class="img " src="images/sin_identificar/u158.png"/>
              <!-- Unnamed () -->
              <div id="u165" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u166" class="ax_h2">
              <img id="u166_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u167" class="text">
                <p><span>Nombre</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u168" class="ax_h2">
              <img id="u168_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u169" class="text">
                <p><span>Apellidos</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u170" class="ax_h2">
              <img id="u170_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u171" class="text">
                <p><span>Email</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u172" class="ax_text_field">
              <input id="u172_input" type="email" value=""/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u173" class="ax_text_field">
              <input id="u173_input" type="text" value=""/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u174" class="ax_text_field">
              <input id="u174_input" type="text" value=""/>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u175" class="ax_html_button">
              <input id="u175_input" type="submit" value="Enviar"/>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u176" class="ax_html_button">
              <input id="u176_input" type="submit" value="Cancelar"/>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u177" class="ax_h2">
              <img id="u177_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u178" class="text">
                <p><span>U</span><span>suario</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u179" class="ax_h2">
              <img id="u179_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u180" class="text">
                <p><span>C</span><span>ontraseña</span></p>
              </div>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u181" class="ax_text_field">
              <input id="u181_input" type="text" value=""/>
            </div>

            <!-- Unnamed (Text Field) -->
            <div id="u182" class="ax_text_field">
              <input id="u182_input" type="password" value=""/>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u183" class="ax_image">
              <img id="u183_img" class="img " src="images/sin_identificar/u191.png"/>
              <!-- Unnamed () -->
              <div id="u184" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u156_state2" class="panel_state" data-label="State3">
          <div id="u156_state2_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u185" class="ax_image">
              <img id="u185_img" class="img " src="images/sin_identificar/u158.png"/>
              <!-- Unnamed () -->
              <div id="u186" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u187" class="ax_h2">
              <img id="u187_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u188" class="text">
                <p><span>Canciones</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u189" class="ax_h2">
              <img id="u189_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u190" class="text">
                <p><span>Artistas</span></p>
              </div>
            </div>

            <!-- canciones (Dynamic Panel) -->
            <div id="u191" class="ax_dynamic_panel" data-label="canciones">
              <div id="u191_state0" class="panel_state" data-label="State1">
                <div id="u191_state0_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u192" class="ax_image">
                    <img id="u192_img" class="img " src="images/sin_identificar/u95.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u193" class="text">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Unnamed (Image) -->
                  <div id="u194" class="ax_image">
                    <img id="u194_img" class="img " src="images/sin_identificar/u99.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u195" class="text">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Unnamed (Image) -->
                  <div id="u196" class="ax_image">
                    <img id="u196_img" class="img " src="images/sin_identificar/u128.png"/>
                    <!-- Unnamed () -->
                    <div id="u197" class="text">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Unnamed (Image) -->
                  <div id="u198" class="ax_image">
                    <img id="u198_img" class="img " src="images/sin_identificar/u103.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u199" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Artistas (Dynamic Panel) -->
            <div id="u200" class="ax_dynamic_panel" data-label="Artistas">
              <div id="u200_state0" class="panel_state" data-label="State1">
                <div id="u200_state0_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u201" class="ax_image">
                    <img id="u201_img" class="img " src="images/sin_identificar/u209.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u202" class="text">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Unnamed (Image) -->
                  <div id="u203" class="ax_image">
                    <img id="u203_img" class="img " src="images/sin_identificar/u211.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u204" class="text">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Unnamed (Image) -->
                  <div id="u205" class="ax_image">
                    <img id="u205_img" class="img " src="images/sin_identificar/u26.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u206" class="text">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Unnamed (Image) -->
                  <div id="u207" class="ax_image">
                    <img id="u207_img" class="img " src="images/sin_identificar/u215.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u208" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u209" class="ax_html_button">
              <input id="u209_input" type="submit" value="Enviar"/>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u210" class="ax_html_button">
              <input id="u210_input" type="submit" value="Cancelar"/>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u211" class="ax_image">
              <img id="u211_img" class="img " src="images/sin_identificar/u95.jpg"/>
              <!-- Unnamed () -->
              <div id="u212" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u213" class="ax_paragraph">
              <img id="u213_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u214" class="text">
                <p><span>Pasos de 0 - (Pablo Alboran)</span></p>
              </div>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u215" class="ax_image">
              <img id="u215_img" class="img " src="images/sin_identificar/u223.png"/>
              <!-- Unnamed () -->
              <div id="u216" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- corazones (Dynamic Panel) -->
            <div id="u217" class="ax_dynamic_panel" data-label="corazones">
              <div id="u217_state0" class="panel_state" data-label="State2">
                <div id="u217_state0_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u218" class="ax_image">
                    <img id="u218_img" class="img " src="images/sin_identificar/u228.png"/>
                    <!-- Unnamed () -->
                    <div id="u219" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
              <div id="u217_state1" class="panel_state" data-label="State3">
                <div id="u217_state1_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u220" class="ax_image">
                    <img id="u220_img" class="img " src="images/sin_identificar/u230.png"/>
                    <!-- Unnamed () -->
                    <div id="u221" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
              <div id="u217_state2" class="panel_state" data-label="State4">
                <div id="u217_state2_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u222" class="ax_image">
                    <img id="u222_img" class="img " src="images/sin_identificar/u232.png"/>
                    <!-- Unnamed () -->
                    <div id="u223" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- fav (Dynamic Panel) -->
            <div id="u224" class="ax_dynamic_panel" data-label="fav">
              <div id="u224_state0" class="panel_state" data-label="State1">
                <div id="u224_state0_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u225" class="ax_image">
                    <img id="u225_img" class="img " src="images/sin_identificar/u235.png"/>
                    <!-- Unnamed () -->
                    <div id="u226" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
              <div id="u224_state1" class="panel_state" data-label="State2">
                <div id="u224_state1_content" class="panel_state_content">

                  <!-- Unnamed (Image) -->
                  <div id="u227" class="ax_image">
                    <img id="u227_img" class="img " src="images/sin_identificar/u237.png"/>
                    <!-- Unnamed () -->
                    <div id="u228" class="text">
                      <p><span></span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u229" class="ax_shape">
              <img id="u229_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u230" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u231" class="ax_shape">
              <img id="u231_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u232" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u233" class="ax_shape">
              <img id="u233_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u234" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
        <div id="u156_state3" class="panel_state" data-label="State4">
          <div id="u156_state3_content" class="panel_state_content">

            <!-- Unnamed (Image) -->
            <div id="u235" class="ax_image">
              <img id="u235_img" class="img " src="images/sin_identificar/u158.png"/>
              <!-- Unnamed () -->
              <div id="u236" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u237" class="ax_h2">
              <img id="u237_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u238" class="text">
                  <a href="randomId"><p><span>Radio normal</span></p></a>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u239" class="ax_h2">
              <img id="u239_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u240" class="text">
                  <a href="recommendations"><p><span>Radio Personalizada</span></p></a>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u241" class="ax_h2">
              <img id="u241_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u242" class="text">
                <p><span>Radio artistas favoritos</span></p>
              </div>
            </div>

            <!-- Unnamed (Shape) -->
            <div id="u243" class="ax_h2">
              <img id="u243_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u244" class="text">
                  <a href="recommendations"><p><span>Radio canciones favoritas</span></p></a>
              </div>
            </div>

            <!-- Unnamed (HTML Button) -->
            <div id="u245" class="ax_html_button">
              <input id="u245_input" type="submit" value="Cancelar"/>
            </div>

            <!-- Unnamed (Image) -->
            <div id="u246" class="ax_image">
              <img id="u246_img" class="img " src="images/sin_identificar/u256.png"/>
              <!-- Unnamed () -->
              <div id="u247" class="text">
                <p><span></span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u248" class="ax_shape">
        <img id="u248_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u249" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u250" class="ax_shape">
        <img id="u250_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u251" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u252" class="ax_shape">
        <img id="u252_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u253" class="text">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u254" class="ax_shape">
        <img id="u254_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u255" class="text">
          <p><span></span></p>
        </div>
      </div>
    </div>

</td>
</tr>
</table>

  </body>
</html>
