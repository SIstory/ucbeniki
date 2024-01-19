<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../sistory/html5-foundation6/to.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
  
   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- ../../../  -->
   <!--  -->
   <xsl:param name="path-general">https://www2.sistory.si/publikacije/</xsl:param>
   
   <xsl:param name="localWebsite">false</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>
   
   <xsl:param name="homeLabel">Ucbeniki</xsl:param>
   <xsl:param name="homeURL">https://sistory.github.io/ucbeniki/</xsl:param>
   
   <xsl:param name="splitLevel">1</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>
   
   <!-- Dvojezična verzija -->
   <xsl:param name="documentationLanguage">en</xsl:param>
   
   <xsl:param name="languages-locale">true</xsl:param>
   <xsl:param name="languages-locale-primary">sl</xsl:param>
   
   <!-- odstranim pri spodnjih param true -->
   <xsl:param name="numberFigures"></xsl:param>
   <xsl:param name="numberFrontTables"></xsl:param>
   <xsl:param name="numberHeadings"></xsl:param>
   <xsl:param name="numberParagraphs"></xsl:param>
   <xsl:param name="numberTables"></xsl:param>
   
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description"></xsl:param>
   <xsl:param name="keywords"></xsl:param>
   <xsl:param name="title"></xsl:param>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za glavno vsebino (glavna navigacija)</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-body-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">List of textbooks</xsl:when>
         <xsl:otherwise>Seznam učbenikov</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za indekse</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-front-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Content</xsl:when>
         <xsl:otherwise>Vsebina</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za indekse</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-index-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Tabular display</xsl:when>
         <xsl:otherwise>Tabelarni prikaz</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="divGen-main-content">
      <xsl:param name="thisLanguage"/>
      <!-- kolofon CIP -->
      <xsl:if test="self::tei:divGen[@type='cip']">
         <xsl:apply-templates select="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc" mode="kolofon"/>
      </xsl:if>
      <!-- TEI kolofon -->
      <xsl:if test="self::tei:divGen[@type='teiHeader']">
         <xsl:apply-templates select="ancestor::tei:TEI/tei:teiHeader"/>
      </xsl:if>
      <!-- kazalo vsebine toc -->      
      <xsl:if test="self::tei:divGen[@type='toc'][@xml:id='toc'] | self::tei:divGen[@type='toc'][tokenize(@xml:id,'-')[last()]='toc']">
         <xsl:choose>
            <xsl:when test="$languages-locale='true'">
               <xsl:call-template name="mainTOC-my">
                  <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="mainTOC"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
      <!-- kazalo slik -->
      <xsl:if test="self::tei:divGen[@type='toc'][@xml:id='images'] | self::tei:divGen[@type='toc'][tokenize(@xml:id,'-')[last()]='images']">
         <xsl:call-template name="images"/>
      </xsl:if>
      <!-- kazalo grafikonov -->
      <xsl:if test="self::tei:divGen[@type='toc'][@xml:id='charts'] | self::tei:divGen[@type='toc'][tokenize(@xml:id,'-')[last()]='charts']">
         <xsl:call-template name="charts"/>
      </xsl:if>
      
      <!-- prazen divGen, v katerem lahko naknadno poljubno procesiramo vsebino -->
      <xsl:if test="self::tei:divGen[@type='content']">
         <xsl:call-template name="divGen-process-content"/>
      </xsl:if>
      
      <!-- kazalo tabel -->
      <xsl:if test="self::tei:divGen[@type='toc'][@xml:id='tables'] | self::tei:divGen[@type='toc'][tokenize(@xml:id,'-')[last()]='tables']">
         <xsl:call-template name="tables"/>
      </xsl:if>
      <!-- kazalo vsebine toc, ki izpiše samo glavne naslove poglavij, skupaj z imeni avtorjev poglavij -->
      <xsl:if test="self::tei:divGen[@type='toc'][@xml:id='titleAuthor'] | self::tei:divGen[@type='toc'][tokenize(@xml:id,'-')[last()]='titleAuthor']">
         <xsl:call-template name="TOC-title-author"/>
      </xsl:if>
      <!-- kazalo vsebine toc, ki izpiše samo naslove poglavij, kjer ima div atributa type in xml:id -->
      <xsl:if test="self::tei:divGen[@type='toc'][@xml:id='titleType'] | self::tei:divGen[@type='toc'][tokenize(@xml:id,'-')[last()]='titleType']">
         <xsl:call-template name="TOC-title-type"/>
      </xsl:if>
      <!-- seznam (indeks) oseb -->
      <xsl:if test="self::tei:divGen[@type='index'][@xml:id='persons'] | self::tei:divGen[@type='index'][tokenize(@xml:id,'-')[last()]='persons']">
         <xsl:call-template name="persons"/>
      </xsl:if>
      <!-- seznam (indeks) krajev -->
      <xsl:if test="self::tei:divGen[@type='index'][@xml:id='places'] | self::tei:divGen[@type='index'][tokenize(@xml:id,'-')[last()]='places']">
         <xsl:call-template name="places"/>
      </xsl:if>
      <!-- seznam (indeks) organizacij -->
      <xsl:if test="self::tei:divGen[@type='index'][@xml:id='organizations'] | self::tei:divGen[@type='index'][tokenize(@xml:id,'-')[last()]='organizations']">
         <xsl:call-template name="organizations"/>
      </xsl:if>
      <!-- iskalnik -->
      <xsl:if test="self::tei:divGen[@type='search']">
         <xsl:call-template name="search"/>
      </xsl:if>
      <!-- DODAL SPODNJO SAMO ZA TO PRETVORBO! -->
      <!-- za generiranje datatable -->   
      <xsl:if test="self::tei:divGen[@type='index'][@xml:id='main-sl']">
         <xsl:call-template name="datatables-main"/>
      </xsl:if>
      <xsl:if test="self::tei:divGen[@type='index'][@xml:id='main']">
         <xsl:call-template name="en-datatables-main"/>
      </xsl:if>         
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>V css in javascript Hook dodam imageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="cssHook">
      <xsl:if test="$title-bar-sticky = 'true'">
         <xsl:value-of select="concat($path-general,'themes/css/foundation/6/sistory-sticky_title_bar.css')"/>
      </xsl:if>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/plugin/TipueSearch/6.1/tipuesearch/css/normalize.css')}" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/css/plugin/TipueSearch/6.1/my-tipuesearch.css')}" rel="stylesheet" type="text/css" />
      <!-- dodan imageViewer -->
      <link href="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.css')}" rel="stylesheet" type="text/css" />
      <!-- dodan openseadragon -->
      <link href="{concat($path-general,'themes/library/openseadragon/2.4.2/openseadragon.css')}" rel="stylesheet" type="text/css" />
      <!-- dodam projektno specifičen css, ki se nahaja v istem direktoriju kot ostali HTML dokumenti -->
      <link href="project_ucb.css" rel="stylesheet" type="text/css"/> 
   </xsl:template>
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>[html] Hook where extra Javascript functions can be defined</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="javascriptHook">
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/jquery.js')}"></script>
      <!-- za highcharts -->
      <xsl:if test="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']]">
         <xsl:variable name="jsfile" select="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']][1]/tei:graphic[@mimeType = 'application/javascript']/@url"/>
         <xsl:variable name="chart-jsfile" select="document($jsfile)/html/body/script[1]/@src"/>
         <script src="{$chart-jsfile[1]}"></script>
      </xsl:if>
      <!-- za back-to-top in highcharts je drugače potrebno dati jquery, vendar sedaj ne rabim dodajati jquery kodo,
         ker je že vsebovana zgoraj -->
      <!-- dodan imageViewer -->
      <script src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.js')}"></script>
      <!-- dodan openseadragon -->
      <script src="{concat($path-general,'themes/library/openseadragon/2.4.2/openseadragon.min.js')}"></script>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Dokler ne uredim faksimilov, začasno izbrišem procesiranje slik</desc>
   </doc>
   <xsl:template match="tei:figure[ancestor::tei:body][not(tei:graphic)]">
      
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>samo slika naslovnice ali pa galerija slik</desc>
   </doc>
   <xsl:template match="tei:figure[ancestor::tei:body][tei:graphic]">
      <xsl:choose>
         <!-- začasno tisti, kjer so slike na Emoncu: ko urediš, briši head -->
         <xsl:when test="tei:head">
            <xsl:choose>
               <xsl:when test="tei:graphic[2]">
                  <xsl:if test="not(preceding-sibling::*[1][self::tei:figure])">
                     <style>
                        #image-gallery {
                        width: 100%;
                        position: relative;
                        height: 650px;
                        background: #000;
                        }
                        #image-gallery .image-container {
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 50px;
                        }
                        #image-gallery .prev,
                        #image-gallery .next {
                        position: absolute;
                        height: 32px;
                        margin-top: -66px;
                        top: 50%;
                        }
                        #image-gallery .prev {
                        left: 20px;
                        }
                        #image-gallery .next {
                        right: 20px;
                        cursor: pointer;
                        }
                        #image-gallery .footer-info {
                        position: absolute;
                        height: 50px;
                        width: 100%;
                        left: 0;
                        bottom: 0;
                        line-height: 50px;
                        font-size: 24px;
                        text-align: center;
                        color: white;
                        border-top: 1px solid #FFF;
                        }
                     </style>
                  </xsl:if>
                  <xsl:if test="preceding-sibling::*[1][self::tei:figure]">
                     <style>
                        #image-gallery2 {
                        width: 100%;
                        position: relative;
                        height: 650px;
                        background: #000;
                        }
                        #image-gallery2 .image-container {
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 50px;
                        }
                        #image-gallery2 .prev,
                        #image-gallery2 .next {
                        position: absolute;
                        height: 32px;
                        margin-top: -66px;
                        top: 50%;
                        }
                        #image-gallery2 .prev {
                        left: 20px;
                        }
                        #image-gallery2 .next {
                        right: 20px;
                        cursor: pointer;
                        }
                        #image-gallery2 .footer-info {
                        position: absolute;
                        height: 50px;
                        width: 100%;
                        left: 0;
                        bottom: 0;
                        line-height: 50px;
                        font-size: 24px;
                        text-align: center;
                        color: white;
                        border-top: 1px solid #FFF;
                        }
                     </style>
                  </xsl:if>
                  <div id="image-gallery{if (preceding-sibling::*[1][self::tei:figure]) then '2' else ''}">
                     <div class="image-container"></div>
                     <img src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/images/left.svg')}" class="prev"/>
                     <img src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/images/right.svg')}"  class="next"/>
                     <div class="footer-info">
                        <span class="current"></span>/<span class="total"></span>
                     </div>
                  </div>   
                  <script type="text/javascript">
                     $(function () {
                     var images = [
                     <xsl:for-each select="tei:graphic">
                        <xsl:variable name="image"
                           select="substring-before(tokenize(@url,'\|')[last()], '/info.json')"/>
                        <xsl:variable name="image-small-iiif" select="concat('https://www2.sistory.si/publikacije/jezuitika/facs/',parent::tei:figure/tei:head,'-small/',$image)"/>
                        <xsl:variable name="image-large-iiif" select="concat('https://www2.sistory.si/publikacije/jezuitika/facs/',parent::tei:figure/tei:head,'/',$image)"/>
                        <xsl:text>{
                 small : '</xsl:text><xsl:value-of select="$image-small-iiif"/><xsl:text>',
                 big : '</xsl:text><xsl:value-of select="$image-large-iiif"/><xsl:text>'
               }</xsl:text><xsl:if test="position() != last()">
                  <xsl:text>,</xsl:text>
               </xsl:if>
                     </xsl:for-each>
                     <xsl:text>];</xsl:text>
                     
                     var curImageIdx = 1,
                     total = images.length;
                     var wrapper = $('#image-gallery<xsl:value-of select="if (preceding-sibling::*[1][self::tei:figure]) then '2' else ''"/>'),
                     curSpan = wrapper.find('.current');
                     var viewer = ImageViewer(wrapper.find('.image-container'));
                     
                     //display total count
                     wrapper.find('.total').html(total);
                     
                     <xsl:text disable-output-escaping="yes"><![CDATA[function showImage(){
               var imgObj = images[curImageIdx - 1];
               viewer.load(imgObj.small, imgObj.big);
               curSpan.html(curImageIdx);
               }
               
               wrapper.find('.next').click(function(){
               curImageIdx++;
               if(curImageIdx > total) curImageIdx = 1;
               showImage();
               });
               
               wrapper.find('.prev').click(function(){
               curImageIdx--;
               if(curImageIdx < 0) curImageIdx = total;
               showImage();
               });
               
               //initially show image
               showImage();
               });]]></xsl:text>
                  </script>
                  <br/>
                  <br/>
               </xsl:when>
               <xsl:otherwise>
                  <!-- v resnici samo ena slika -->
                  <xsl:for-each select="tei:graphic">
                     <xsl:variable name="image"
                        select="substring-before(tokenize(@url,'\|')[last()], '/info.json')"/>
                     <xsl:variable name="image-small-iiif" select="concat('https://www2.sistory.si/publikacije/jezuitika/facs/',parent::tei:figure/tei:head,'-small/',$image)"/>
                     <xsl:variable name="image-large-iiif" select="concat('https://www2.sistory.si/publikacije/jezuitika/facs/',parent::tei:figure/tei:head,'/',$image)"/>
                     <style>
                        #image-gallery {
                        width: 100%;
                        position: relative;
                        height: 650px;
                        background: #000;
                        }
                        #image-gallery .image-container {
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 50px;
                        }
                     </style>
                     <div id="image-gallery">
                        <div class="image-container text-center">
                           <img class="imageviewer" style="height:600px;" src="{$image-small-iiif}" data-high-res-src="{$image-large-iiif}"/>
                        </div>
                     </div>
                     <br/>
                     <br/>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <!-- redno procesiranje slik iz IIIF -->
         <xsl:otherwise>
            <br/>
            <div id="{@xml:id}"
               class="openseadragon">
               <script type="text/javascript">
                  OpenSeadragon({
                  id:            "<xsl:value-of select="@xml:id"/>",
                  prefixUrl:     "https://openseadragon.github.io/openseadragon/images/",
                  showNavigator:  true,
                  sequenceMode:  true,
                  <xsl:if test="tei:graphic[2]">
                     <xsl:text>showReferenceStrip: true,</xsl:text>
                  </xsl:if>
                  tileSources:   [
                  <xsl:for-each select="tei:graphic">
                     <xsl:value-of select="concat('&quot;',@url,'&quot;')"/>
                     <xsl:if test="position() != last()">
                        <xsl:text>,&#xA;</xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  ]
                  });
               </script>
            </div>
            <br/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Dodam zaključni javascript za ImageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="bodyEndHook">
      <script type="text/javascript">
         $(function () {
         $('.imageviewer').ImageViewer();
         });
         
         <!--$(function () {
         var viewer = ImageViewer();
         $('.imageviewer').click(function () {
         var imgSrc = this.src,
         highResolutionImage = $(this).data('high-res-src');
         viewer.show(imgSrc, highResolutionImage);
         });
         });-->
      </script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/what-input.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/foundation.min.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/app.js')}"></script>
      <!-- back-to-top -->
      <script src="{concat($path-general,'themes/js/plugin/back-to-top/back-to-top.js')}"></script>
      
   </xsl:template>
   
   
   <!-- Novo procesiranje vsebine v body//div -->
   
   <!--<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:head[ancestor::tei:body][not(parent::tei:div[parent::tei:body])]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;">
         <div style="width: 200px;">Naslov:</div>
         <div style="flex: 1;">
            <xsl:value-of select="substring-after(normalize-space(.),': ')"/>
         </div>
      </div>
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;">
         <div style="width: 200px;">Priložnost:</div>
         <div style="flex: 1;">
            <xsl:value-of select="substring-before(normalize-space(.),': ')"/>
         </div>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:note[@type='provenance'][ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{@xml:id}">
         <div style="width: 200px;">Nahajališče:</div>
         <div style="flex: 1;">
            <xsl:value-of select="substring-before(normalize-space(.),': ')"/>
         </div>
      </div>
      <xsl:if test="tei:ref">
         <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;">
            <div style="width: 200px;">Prvotna objava:</div>
            <div style="flex: 1;">
               <a href="{tei:ref/@target}" target="_blank">
                  <xsl:value-of select="tei:ref"/>
               </a>
            </div>
         </div>
      </xsl:if>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:note[not(@type)][ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{@xml:id}">
         <div style="width: 200px;">Opomba:</div>
         <div style="flex: 1;">
            <xsl:value-of select="normalize-space(.)"/>
         </div>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:bibl[ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{@xml:id}">
         <div style="width: 200px;">Prvotni naslov:</div>
         <div style="flex: 1;">
            <xsl:value-of select="normalize-space(.)"/>
         </div>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:note[@type='date'][ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{@xml:id}">
         <div style="width: 200px;">Prvotna datacija:</div>
         <div style="flex: 1;">
            <xsl:value-of select="normalize-space(.)"/>
         </div>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:quote[ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{@xml:id}">
         <div style="width: 200px;">Navedba citata:</div>
         <div style="flex: 1;">
            <xsl:value-of select="normalize-space(.)"/>
         </div>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:cit[ancestor::tei:body]">
      <xsl:apply-templates/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:cit/tei:ref[ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{parent::tei:cit/@xml:id}">
         <div style="width: 200px;">Vir citata:</div>
         <div style="flex: 1;">
            <xsl:value-of select="normalize-space(.)"/>
         </div>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:label[ancestor::tei:body]">
      <div style="line-height: 25px; margin-bottom: 3px; display: flex; flex-direction: row;" id="{@xml:id}">
         <div style="width: 200px;">
            <xsl:choose>
               <xsl:when test="@type='provenience'">Stopnja ohranjenosti:</xsl:when>
               <xsl:when test="@type='genre'">Zvrst predstavitve:</xsl:when>
               <xsl:when test="@type='type'">Vrsta predstavitve:</xsl:when>
            </xsl:choose>
         </div>
         <div style="flex: 1;">
            <xsl:value-of select="normalize-space(.)"/>
         </div>
      </div>
   </xsl:template>-->
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template name="en-datatables-main">
      <link rel="stylesheet" type="text/css" href="{if ($localWebsite='true') then 'datatables.min.css' else '//cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css'}" />
      <script type="text/javascript" src="{if ($localWebsite='true') then 'datatables.min.js' else '//cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js'}"></script>
      
      <!-- ===== Dodatne resource datoteke ======================================= -->
      <script type="text/javascript" src="{if ($localWebsite='true') then 'dataTables.responsive.min.js' else 'https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'dataTables.buttons.min.js' else 'https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.colVis.min.js' else 'https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'dataTables.colReorder.min.js' else 'https://cdn.datatables.net/colreorder/1.7.0/js/dataTables.colReorder.min.js'}"></script>
      
      <script type="text/javascript" src="{if ($localWebsite='true') then 'jszip.min.js' else 'https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'pdfmake.min.js' else 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'vfs_fonts.js' else 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.html5.min.js' else 'https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js'}"></script><!--
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.html5.min.js' else 'https://cdn.datatables.net/plug-ins/1.13.4/dataRender/ellipsis.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.html5.min.js' else 'https://cdn.datatables.net/plug-ins/1.13.5/dataRender/hyperLink.js'}"></script>-->
      <!--<script type="text/javascript">
        $(document).ready(function () {
            $('#datatableMain').DataTable({
                dom: 'Bfrtip',
                buttons:[ {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    pageSize: 'LEGAL'
                }]
            });
        });</script>-->
      <!-- določi, kje je naša dodatna DataTables js datoteka -->
      <script type="text/javascript" src="{if ($localWebsite='true') then 'en-range-filter-external-main.js' else 'en-range-filter-external-main.js'}"></script>
      
      <link href="{if ($localWebsite='true') then 'responsive.dataTables.min.css' else 'https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css'}" rel="stylesheet" type="text/css" />
      <link href="{if ($localWebsite='true') then 'buttons.dataTables.min.css' else 'https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css'}" rel="stylesheet" type="text/css" />
      <!-- ===== Dodatne resource datoteke ======================================= -->
      
      <style>
         *, *::after, *::before {
         box-sizing: border-box;
         }
         .pagination .current {
         background: #8e130b;
         }
      </style>
      
      <script>
         var columnIDs = [-1];
      </script>
      
      <ul class="accordion" data-accordion="" data-allow-all-closed="true">
         <li class="accordion-item" data-accordion-item="">
            <a href="#" class="accordion-title">Filter year</a>
            <div class="accordion-content rangeFilterWrapper" data-target="2" data-tab-content="">
               <div class="row">
                  <div class="small-3 columns">
                     <label for="middle-label" class="text-right middle">Filter from year</label>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMinYear" maxlength="4" placeholder="Year"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMinMonth" maxlength="2" placeholder="Month"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMinDay" maxlength="2" placeholder="Day"/>
                  </div>
               </div>
               <div class="row">
                  <div class="small-3 columns">
                     <label for="middle-label" class="text-right middle">to year</label>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMaxYear" maxlength="4" placeholder="Year"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMaxMonth" maxlength="2" placeholder="Month"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMaxDay" maxlength="2" placeholder="Day"/>
                  </div>
                  <div class="small-12 columns" style="text-align: right;">
                     <a class="clearRangeFilter" href="#">Clear filter</a>
                  </div>
               </div>
            </div>
         </li>
      </ul>
      
      <div>
         <table id="en-datatableMain" class="display responsive targetTable" width="100%" cellspacing="0">
            <thead>
               <tr>
                  <th>Title (first edition)</th>
                  <th>Author</th>
                  <th>Year</th>
                  <th>Place (first edition)</th>
                  <th>Subject</th>
                  <th>Author of the adaptation / Translator / Editor</th>
                  <th>Title (subsequent editions)</th>
                  <th>Place (later editions)</th>
                  <th>Publisher (first edition)</th>
                  <th>Publisher (subsequent editions)</th>
                  <th>Links to digitized material</th>
                  <th>COBISS (library)</th>
                  <th>Sources and Bibliography</th>
                  <th>ID</th>
                  <th>Notes</th>
               </tr>
            </thead>
            <tfoot>
               <tr>
                  <!--                  <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>-->
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Search" type="text"/></th>
                  <th></th>
               </tr>
            </tfoot>
            <tbody>
            <xsl:result-document href="docs/en-data-main.json" method="text" encoding="UTF-8">
               <xsl:text>{
  "data": [&#xA;</xsl:text>
               <xsl:for-each select="//tei:body/tei:div[2]/tei:div">
                  <xsl:variable name="ebookID" select="@xml:id"/>
                  <xsl:variable name="ebookTitle" select="descendant::tei:row/tei:cell[@ana='title']"/>
                  <xsl:variable name="ebookAuthor" select="descendant::tei:row/tei:cell[@ana='author']"/>
                  <xsl:variable name="ebookYear" select="descendant::tei:row/tei:cell[@ana='year']"/>
                  <xsl:variable name="ebookPlace" select="descendant::tei:row/tei:cell[@ana='place']"/>
                  <xsl:variable name="ebookSubject" select="descendant::tei:row/tei:cell[@ana='subject']"/>
                  <xsl:variable name="ebookCover" select="descendant::tei:row/tei:cell[@ana='coverAuthor']"/>
                  <xsl:variable name="ebookTitleNew" select="descendant::tei:row/tei:cell[@ana='titleNew']"/>
                  <xsl:variable name="ebookPlaceNew" select="descendant::tei:row/tei:cell[@ana='placeNew']"/>
                  <xsl:variable name="ebookFirstPublisher" select="descendant::tei:row/tei:cell[@ana='firstPublisher']"/>
                  <xsl:variable name="ebookOtherPublisher" select="descendant::tei:row/tei:cell[@ana='otherPublisher']"/>
                  <xsl:variable name="ebookLink" select="descendant::tei:row/tei:cell[@ana='link']"/>
                  <xsl:variable name="ebookCobiss" select="descendant::tei:row/tei:cell[@ana='cobiss']"/>
                  <xsl:variable name="ebookBiblio" select="descendant::tei:row/tei:cell[@ana='biblio']"/>
                  <xsl:variable name="ebookNote" select="descendant::tei:row/tei:cell[@ana='note']"/>
                  <xsl:text>[&#xA;</xsl:text>
                  
                  <!-- Naslov --><!--
                  <xsl:variable name="prvihXznakov" select="substring($bookTitle, 1, 20)" />-->
                  <xsl:text>&quot;</xsl:text>
                  <xsl:value-of select="concat('&lt;a href=\&quot;',$ebookID,'.html','\&quot; target=\&quot;_blank\&quot;&gt;',$ebookTitle,'&lt;/a&gt;')"/>
<!--                  <xsl:value-of select="concat('&quot;',$bookTitle,'&quot;')"/>-->
                  <xsl:text>&quot;,&#xA;</xsl:text>
                  
                  <!-- avtor -->
                  <xsl:value-of select="concat('&quot;',$ebookAuthor,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Leto -->
                  <xsl:value-of select="concat('&quot;',$ebookYear,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Kraj -->
                  <xsl:value-of select="concat('&quot;',$ebookPlace,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Predmet -->
                  <xsl:value-of select="concat('&quot;',$ebookSubject,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- avtor priredbe -->
                  <xsl:value-of select="concat('&quot;',$ebookCover,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Naslov (poznejše izdaje) -->
                  <xsl:value-of select="concat('&quot;',$ebookTitleNew,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Kraj (poznejše izdaje) -->
                  <xsl:value-of select="concat('&quot;',$ebookPlaceNew,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Založnik (prva izdaja) -->
                  <xsl:value-of select="concat('&quot;',$ebookFirstPublisher,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Založnik (poznejše izdaje) -->
                  <xsl:value-of select="concat('&quot;',$ebookOtherPublisher,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Povezava na digitalizirane učbenike -->
                  <xsl:value-of select="concat('&quot;',$ebookLink,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- Povezava na cobiss -->
                  <xsl:value-of select="concat('&quot;',$ebookCobiss,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  <!-- viri in literatura -->
                  <xsl:value-of select="concat('&quot;',$ebookBiblio,'&quot;')"/>
                  <xsl:text>,&#xA;</xsl:text>
                  
                  
                  <!-- ID -->
                  <xsl:text>&quot;</xsl:text>
                  <xsl:value-of select="concat('&lt;a href=\&quot;',$ebookID,'.html','\&quot; target=\&quot;_blank\&quot;&gt;',$ebookID,'&lt;/a&gt;')"/>
                  <xsl:text>&quot;,&#xA;</xsl:text>
                  
                  
                  <!-- opombe -->
                  <xsl:value-of select="concat('&quot;',$ebookNote,'&quot;')"/>
                  <xsl:text>&#xA;</xsl:text>
                  
                  <xsl:text>]</xsl:text>
                  <xsl:if test="position() != last()">
                     <xsl:text>,
                     </xsl:text>
                  </xsl:if>
               </xsl:for-each>
               <xsl:text>]
}</xsl:text>
            </xsl:result-document>
            
            </tbody>
         </table>
         <br/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template name="datatables-main">
      <link rel="stylesheet" type="text/css" href="{if ($localWebsite='true') then 'datatables.min.css' else '//cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css'}" />
      <script type="text/javascript" src="{if ($localWebsite='true') then 'datatables.min.js' else '//cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js'}"></script>
      
      <!-- ===== Dodatne resource datoteke ======================================= -->
      <script type="text/javascript" src="{if ($localWebsite='true') then 'dataTables.responsive.min.js' else 'https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'dataTables.buttons.min.js' else 'https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.colVis.min.js' else 'https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'dataTables.colReorder.min.js' else 'https://cdn.datatables.net/colreorder/1.7.0/js/dataTables.colReorder.min.js'}"></script>
      
      <script type="text/javascript" src="{if ($localWebsite='true') then 'jszip.min.js' else 'https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'pdfmake.min.js' else 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'vfs_fonts.js' else 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.html5.min.js' else 'https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js'}"></script><!--
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.html5.min.js' else 'https://cdn.datatables.net/plug-ins/1.13.4/dataRender/ellipsis.js'}"></script>
      <script type="text/javascript" src="{if ($localWebsite='true') then 'buttons.html5.min.js' else 'https://cdn.datatables.net/plug-ins/1.13.5/dataRender/hyperLink.js'}"></script>-->
      <!--<script type="text/javascript">
        $(document).ready(function () {
            $('#datatableMain').DataTable({
                dom: 'Bfrtip',
                buttons:[ {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    pageSize: 'LEGAL'
                }]
            });
        });</script>-->
      <!-- določi, kje je naša dodatna DataTables js datoteka -->
      <script type="text/javascript" src="{if ($localWebsite='true') then 'range-filter-external-main.js' else 'range-filter-external-main.js'}"></script>
      
      <link href="{if ($localWebsite='true') then 'responsive.dataTables.min.css' else 'https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css'}" rel="stylesheet" type="text/css" />
      <link href="{if ($localWebsite='true') then 'buttons.dataTables.min.css' else 'https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css'}" rel="stylesheet" type="text/css" />
      <!-- ===== Dodatne resource datoteke ======================================= -->
      
      <style>
         *, *::after, *::before {
         box-sizing: border-box;
         }
         .pagination .current {
         background: #8e130b;
         }
      </style>
      
      <script>
         var columnIDs = [-1];
      </script>
      
      <ul class="accordion" data-accordion="" data-allow-all-closed="true">
         <li class="accordion-item" data-accordion-item="">
            <a href="#" class="accordion-title">Filtriraj po letu</a>
            <div class="accordion-content rangeFilterWrapper" data-target="2" data-tab-content="">
               <div class="row">
                  <div class="small-3 columns">
                     <label for="middle-label" class="text-right middle">Filtriraj od leta</label>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMinYear" maxlength="4" placeholder="Leto"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMinMonth" maxlength="2" placeholder="Mesec"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMinDay" maxlength="2" placeholder="Dan"/>
                  </div>
               </div>
               <div class="row">
                  <div class="small-3 columns">
                     <label for="middle-label" class="text-right middle">do leta</label>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMaxYear" maxlength="4" placeholder="Leto"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMaxMonth" maxlength="2" placeholder="Mesec"/>
                  </div>
                  <div class="small-3 columns">
                     <input type="text" class="rangeMaxDay" maxlength="2" placeholder="Dan"/>
                  </div>
                  <div class="small-12 columns" style="text-align: right;">
                     <a class="clearRangeFilter" href="#">Počisti filter</a>
                  </div>
               </div>
            </div>
         </li>
      </ul>
      
      <div>
         <table id="datatableMain" class="display responsive targetTable" width="100%" cellspacing="0">
            <thead>
               <tr>
                  <th>Naslov (prva izdaja)</th>
                  <th>Avtor</th>
                  <th>Leto</th>
                  <th>Kraj (prva izdaja)</th>
                  <th>Predmet</th>
                  <th>Avtor priredbe / Prevajalec / Urednik</th>
                  <th>Naslov (poznejše izdaje)</th>
                  <th>Kraj (poznejše izdaje)</th>
                  <th>Založnik (prva izdaja)</th>
                  <th>Založnik (poznejše izdaje)</th>
                  <th>Povezava do digitalizirane različice besedila</th>
                  <th>COBISS</th>
                  <th>Viri in literatura</th>
                  <th>ID</th>
                  <th>Opombe</th>
               </tr>
            </thead>
            <tfoot>
               <tr>
                  <!--                  <th><select class="filterSelect"><option value="">Prikaži vse</option></select></th>-->
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th><input class="filterInputText" placeholder="Iskanje" type="text"/></th>
                  <th></th>
               </tr>
            </tfoot>
            <tbody>
               <xsl:result-document href="docs/data-main.json" method="text" encoding="UTF-8">
                  <xsl:text>{
  "data": [&#xA;</xsl:text>
                  <xsl:for-each select="//tei:body/tei:div[1]/tei:div">
                     <xsl:variable name="bookID" select="@xml:id"/>
                     <xsl:variable name="bookTitle" select="descendant::tei:row/tei:cell[@ana='title']"/>
                     <xsl:variable name="bookAuthor" select="descendant::tei:row/tei:cell[@ana='author']"/>
                     <xsl:variable name="bookYear" select="descendant::tei:row/tei:cell[@ana='year']"/>
                     <xsl:variable name="bookPlace" select="descendant::tei:row/tei:cell[@ana='place']"/>
                     <xsl:variable name="bookSubject" select="descendant::tei:row/tei:cell[@ana='subject']"/>
                     <xsl:variable name="bookCover" select="descendant::tei:row/tei:cell[@ana='coverAuthor']"/>
                     <xsl:variable name="bookTitleNew" select="descendant::tei:row/tei:cell[@ana='titleNew']"/>
                     <xsl:variable name="bookPlaceNew" select="descendant::tei:row/tei:cell[@ana='placeNew']"/>
                     <xsl:variable name="bookFirstPublisher" select="descendant::tei:row/tei:cell[@ana='firstPublisher']"/>
                     <xsl:variable name="bookOtherPublisher" select="descendant::tei:row/tei:cell[@ana='otherPublisher']"/>
                     <xsl:variable name="bookLink" select="descendant::tei:row/tei:cell[@ana='link']"/>
                     <xsl:variable name="bookCobiss" select="descendant::tei:row/tei:cell[@ana='cobiss']"/>
                     <xsl:variable name="bookBiblio" select="descendant::tei:row/tei:cell[@ana='biblio']"/>
                     <xsl:variable name="bookNote" select="descendant::tei:row/tei:cell[@ana='note']"/>
                     <xsl:text>[&#xA;</xsl:text>
                     
                     <!-- Naslov --><!--
                  <xsl:variable name="prvihXznakov" select="substring($bookTitle, 1, 20)" />-->
                     <xsl:text>&quot;</xsl:text>
                     <xsl:value-of select="concat('&lt;a href=\&quot;',$bookID,'.html','\&quot; target=\&quot;_blank\&quot;&gt;',$bookTitle,'&lt;/a&gt;')"/>
                     <!--                  <xsl:value-of select="concat('&quot;',$bookTitle,'&quot;')"/>-->
                     <xsl:text>&quot;,&#xA;</xsl:text>
                     
                     <!-- avtor -->
                     <xsl:value-of select="concat('&quot;',$bookAuthor,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Leto -->
                     <xsl:value-of select="concat('&quot;',$bookYear,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Kraj -->
                     <xsl:value-of select="concat('&quot;',$bookPlace,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Predmet -->
                     <xsl:value-of select="concat('&quot;',$bookSubject,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- avtor priredbe -->
                     <xsl:value-of select="concat('&quot;',$bookCover,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Naslov (poznejše izdaje) -->
                     <xsl:value-of select="concat('&quot;',$bookTitleNew,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Kraj (poznejše izdaje) -->
                     <xsl:value-of select="concat('&quot;',$bookPlaceNew,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Založnik (prva izdaja) -->
                     <xsl:value-of select="concat('&quot;',$bookFirstPublisher,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Založnik (poznejše izdaje) -->
                     <xsl:value-of select="concat('&quot;',$bookOtherPublisher,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Povezava na digitalizirane učbenike -->
                     <xsl:value-of select="concat('&quot;',$bookLink,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- Povezava na cobiss -->
                     <xsl:value-of select="concat('&quot;',$bookCobiss,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     <!-- viri in literatura -->
                     <xsl:value-of select="concat('&quot;',$bookBiblio,'&quot;')"/>
                     <xsl:text>,&#xA;</xsl:text>
                     
                     
                     <!-- ID -->
                     <xsl:text>&quot;</xsl:text>
                     <xsl:value-of select="concat('&lt;a href=\&quot;',$bookID,'.html','\&quot; target=\&quot;_blank\&quot;&gt;',$bookID,'&lt;/a&gt;')"/>
                     <xsl:text>&quot;,&#xA;</xsl:text>
                     
                     
                     <!-- opombe -->
                     <xsl:value-of select="concat('&quot;',$bookNote,'&quot;')"/>
                     <xsl:text>&#xA;</xsl:text>
                     
                     <xsl:text>]</xsl:text>
                     <xsl:if test="position() != last()">
                        <xsl:text>,
                     </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:text>]
}</xsl:text>
               </xsl:result-document>
               
            </tbody>
         </table>
         <br/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc> NASLOVNA STRAN </xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titlePage">
      <!-- avtor -->
      <p  class="naslovnicaAvtor">
         <xsl:for-each select="tei:docAuthor">
            <xsl:choose>
               <xsl:when test="tei:forename or tei:surname">
                  <xsl:for-each select="tei:forename">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="tei:surname">
                     <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:for-each select="tei:surname">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() ne last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <!-- naslov: spremenjeno procesiranje naslovov -->
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='sl']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <hr/>
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='en']">
         <h4 class="text-center"><xsl:value-of select="."/></h4>
      </xsl:for-each>
      <br/><!--
      <xsl:if test="tei:figure">
         <div class="text-center">
            <p>
               <img src="{tei:figure/tei:graphic/@url}" alt="naslovna slika"/>
            </p>
         </div>
      </xsl:if>-->
      <xsl:if test="tei:graphic">
         <div class="text-center">
            <p>
               <img src="{tei:graphic/@url}" alt="naslovna slika" style="max-height: 600px;"/>
            </p>
         </div>
      </xsl:if>
      <br/>
      <p class="text-center">
         <!-- založnik -->
         <xsl:for-each select="tei:docImprint/tei:publisher">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-- kraj izdaje -->
         <xsl:for-each select="tei:docImprint/tei:pubPlace">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-- leto izdaje -->
         <xsl:for-each select="tei:docImprint/tei:docDate">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
      </p>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Angleški naslov v svojo vrstico</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titleStmt" mode="kolofon">
      <!-- avtor -->
      <p>
         <xsl:for-each select="tei:author">
            <span itemprop="author">
               <xsl:choose>
                  <xsl:when test="tei:forename or tei:surname">
                     <xsl:for-each select="tei:forename">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() ne last()">
                           <xsl:text> </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                     <xsl:if test="tei:surname">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                     <xsl:for-each select="tei:surname">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() ne last()">
                           <xsl:text> </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="."/>
                  </xsl:otherwise>
               </xsl:choose>
            </span>
            <xsl:if test="position() != last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <!-- Naslov mora vedno biti, zato ne preverjam, če obstaja. -->
      <p itemprop="name">
         <xsl:for-each select="tei:title[1]">
            <b><xsl:value-of select="."/></b>
            <xsl:if test="following-sibling::tei:title">
               <br/>
               <br/>
            </xsl:if>
            <xsl:for-each select="following-sibling::tei:title">
               <b><xsl:value-of select="."/></b>
               <xsl:if test="position() != last()">
                  <xsl:text>, </xsl:text>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each>
      </p>
      <br/>
      <xsl:apply-templates select="tei:respStmt" mode="kolofon"/>
      <br/>
      <xsl:if test="tei:funder">
         <xsl:for-each select="tei:funder">
            <p itemprop="funder">
               <xsl:value-of select="."/>
            </p>
         </xsl:for-each>
      </xsl:if>
      <br/>
   </xsl:template>
   
</xsl:stylesheet>
