
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.net.URLEncoder" language="java" %>

<!-- heatMap.jsp -->
<html:xhtml />

<tiles:importAttribute />

<c:set var="MAX_CLUSTER" value="250" />
<c:set var="MAX_MAP" value="600" />
<c:set var="MAX_DEFAULT_OPEN" value="100" />

<link rel="stylesheet" href="model/canvasXpress.css" type="text/css"/>
<script type="text/javascript" src="model/canvasXpress.min.js"></script>
<!--[if IE]><script type="text/javascript" src="model/canvasXpress/js/excanvas.js"></script><![endif]-->

<div class="body" id="expression_div">

    <script type="text/javascript" charset="utf-8">
     jQuery(document).ready(function () {
         var feature_count = parseInt(${FeatureCount});
         if (feature_count > 100) {
             jQuery("#heatmapGraph").hide();
         } else {
             jQuery("#heatmapGraph").show();
         }
         jQuery("#bro").click(function () {
             if(jQuery("#heatmapGraph").is(":hidden")) {
                 jQuery("#oc").attr("src", "images/disclosed.gif");
             } else {
                 jQuery("#oc").attr("src", "images/undisclosed.gif");
             }
             jQuery("#heatmapGraph").toggle("slow");
         });
     })
    </script>

    <h2>${WEB_PROPERTIES['heatmap.heading']}</h2>
    <h3>${WEB_PROPERTIES['heatmap.subheading']}</h3>
    
    <div id="heatmap_div">

        <p>
            <i>
                Heatmap visualization powered by <a target="_blank" href="http://www.canvasxpress.org">canvasXpress</a>.
                Grab the edges with your mouse to resize the map. Zoom in/out on an area with your scroll wheel.
            </i>
        </p>

        <html:link linkName="#" styleId="bro" style="cursor:pointer">
            <div style="clear:both; padding-left:10px; font-weight:bold; background-color:gray; color:white;">
                <c:if test="${FeatureCount>MAX_DEFAULT_OPEN}">
                    Your list is big and there could be issues with the display:
                    click to see/hide the expression map<img src="images/undisclosed.gif" id="oc">
                </c:if>
                <c:if test="${FeatureCount<=MAX_DEFAULT_OPEN}">
                    Click to see/hide the expression map<img src="images/disclosed.gif" id="oc">
                </c:if>
            </div>
        </html:link>


        <div id="heatmapGraph" style="display:block">

            <c:if test="${FeatureCount>MAX_CLUSTER}">
                <p>
                    Please note that clustering functions are not available for lists with more than ${MAX_CLUSTER} elements.
                </p>
            </c:if>

            <div id="heatmapContainer">

                <div style="width:350px; text-align:center; margin:5px 0px 5px 200px; padding:3px; border:1px solid gray; background-color:#eee;">
                    <c:if test="${FeatureCount>4}">
                        Expression K-means:
                        <select id="smps-km">
                            <option value="2" selected>2</option>
                            <c:forEach begin="3" end="${FeatureCount}" var="val">
                                <option value="${val}">${val}</option>
                            </c:forEach>
                        </select>
                    </c:if>
                    Tissue K-means:
                    <select id="vars-km">
                        <option value="2" selected>2</option>
                        <c:forEach begin="3" end="${ConditionCount}" var="val">
                            <option value="${val}">${val}</option>
                        </c:forEach>
                    </select>
                </div>

                <canvas id="canvasx" width="${WEB_PROPERTIES['heatmap.width']}" height="${WEB_PROPERTIES['heatmap.height']}"></canvas>

            </div>

            <div id="description_div" style="clear:both; padding-left:10px; font-weight:bold; background-color:gray; color:white;">
                More information <img src="images/undisclosed.gif" id="co">
            </div>
            
            <div id="description" style="padding:5px">${WEB_PROPERTIES['heatmap.description']}</div>

        </div>
        
    </div>
    
</div>

<script type="text/javascript">

 var feature_count = parseInt(${FeatureCount});
 var condition_count = parseInt(${ConditionCount});
 var max_cluster = parseInt(${MAX_CLUSTER});
 var max_map = parseInt(${MAX_MAP});

 if (${fn:length(expressionValueJSON)}<10) {
     
     jQuery('#heatmap_div').remove();
     jQuery('#expression_div').html('<i>Expression values are not available</i>');

 } else {

     if (feature_count>max_map) {
         jQuery('#heatmap_div').remove();
         jQuery('#expression_div').html('<i>Too many elements: please select a subset to see the heat maps.</i>');
     }

     jQuery("#description").hide();

     jQuery("#description_div").click(
         function () {
             if (jQuery("#description").is(":hidden")) {
                 jQuery("#co").attr("src", "images/disclosed.gif");
             } else {
                 jQuery("#co").attr("src", "images/undisclosed.gif");
             }
             jQuery("#description").toggle("slow");
         }
     );


     var hm = new CanvasXpress("canvasx",
                               ${expressionValueJSON},
                               {
                                   "graphType": "Heatmap",
                                   "title": "${WEB_PROPERTIES['heatmap.title']} : "+feature_count+" transcripts",
                                   "xAxisTitle": "",
                                   "fontName": "Arial",
                                   "smpLabelScaleFontFactor": ${WEB_PROPERTIES['heatmap.smpLabelScaleFontFactor']},
                                   "smpLabelFontStyle": "${WEB_PROPERTIES['heatmap.smpLabelFontStyle']}",
                                   "smpLabelFontColor": "${WEB_PROPERTIES['heatmap.smpLabelFontColor']}",
                                   "varLabelScaleFontFactor": ${WEB_PROPERTIES['heatmap.varLabelScaleFontFactor']},
                                   "varLabelFontStyle": "${WEB_PROPERTIES['heatmap.varLabelFontStyle']}",
                                   "varLabelFontColor": "${WEB_PROPERTIES['heatmap.varLabelFontColor']}",
                                   "varLabelRotate": ${WEB_PROPERTIES['heatmap.varLabelRotate']},
                                   "colorSpectrum": [ ${WEB_PROPERTIES['heatmap.colorSpectrum']} ],
                                   "colorSpectrumBreaks": [ ${WEB_PROPERTIES['heatmap.colorSpectrumBreaks']} ],
                                   "isLogData": ${WEB_PROPERTIES['heatmap.isLogData']},
                                   "heatmapCellBox": true,
                                   "showHeatMapIndicator": true,
                                   "heatmapIndicatorPosition": "top",
                                   "heatmapIndicatorHistogram": ${WEB_PROPERTIES['heatmap.heatmapIndicatorHistogram']},
                                   "heatmapIndicatorHeight": ${WEB_PROPERTIES['heatmap.heatmapIndicatorHeight']},
                                   "heatmapIndicatorWidth": ${WEB_PROPERTIES['heatmap.heatmapIndicatorWidth']},
                                   "imputeMethod": "median",
                                   "distance": "euclidian",
                                   "centerData": true,
                                   "linkage": "complete",
                                   "showSmpDendrogram": false,
                                   "showVarDendrogram": false,
                                   "kmeansSmpClusters": 2,
                                   "kmeansVarClusters": 2,
                                   "samplesClustered": false,
                                   "samplesKmeaned": false,
                                   "variablesClustered": false,
                                   "variablesKmeaned": false
                               },
                               {
                                   click: function(o) {
                                       var featureId = o.y.smps;
                                       var condition = o.y.vars;
                                       var query = '<query name="" model="genomic" view="ExpressionValue.mRNA.primaryIdentifier ExpressionValue.expressionSample.primaryIdentifier ExpressionValue.value" sortOrder="ExpressionValue.expressionSample.num asc" constraintLogic="A and B"><constraint path="ExpressionValue.mRNA" code="B" op="LOOKUP" value="'+featureId+'" extraValue=""/><constraint path="ExpressionValue.expressionSample" code="A" op="LOOKUP" value="'+condition+'"/></query>';
                                       var encodedQuery = encodeURIComponent(query);
                                       encodedQuery = encodedQuery.replace("%20", "+");
                                       window.open("/${WEB_PROPERTIES['webapp.path']}/loadQuery.do?skipBuilder=true&query="+encodedQuery+"%0A++++++++++++&trail=|query&method=xml");
                                   }
                               }
     );

     // show k-means on conditions
     hm.kmeansVariables(true);

     // show k-means on features if enough features; else disable k-means selector
     if (feature_count>4) {
         hm.kmeansSamples(true);
     } else {
         jQuery("#vars-km").attr('disabled', true);
     }

     // respond to vars-km change
     jQuery("#vars-km").change(
         function() {
             hm.kmeansVarClusters = parseInt(this.value);
             hm.kmeansVariables(true);
         }
     );

     // respond to smps-km change
     jQuery("#smps-km").change(
         function() {
             hm.kmeansSmpClusters = parseInt(this.value);
             hm.kmeansSamples(true);
         }
     );

 }

</script>
<!-- /heatMap.jsp -->