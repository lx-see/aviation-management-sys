/**
* Template Name: NiceAdmin - v2.1.0
* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
(function() {
  "use strict";

  /**
   * Easy selector helper function
   */
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }

  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    if (all) {
      select(el, all).forEach(e => e.addEventListener(type, listener))
    } else {
      select(el, all).addEventListener(type, listener)
    }
  }

  /**
   * Easy on scroll event listener 
   */
  const onscroll = (el, listener) => {
    el.addEventListener('scroll', listener)
  }

  /**
   * Sidebar toggle
   */
  if (select('.toggle-sidebar-btn')) {
    on('click', '.toggle-sidebar-btn', function(e) {
      select('body').classList.toggle('toggle-sidebar')
    })
  }

  /**
   * Search bar toggle
   */
  if (select('.search-bar-toggle')) {
    on('click', '.search-bar-toggle', function(e) {
      select('.search-bar').classList.toggle('search-bar-show')
    })
  }

  /**
   * Navbar links active state on scroll
   */
  let navbarlinks = select('#navbar .scrollto', true)
  const navbarlinksActive = () => {
    let position = window.scrollY + 200
    navbarlinks.forEach(navbarlink => {
      if (!navbarlink.hash) return
      let section = select(navbarlink.hash)
      if (!section) return
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        navbarlink.classList.add('active')
      } else {
        navbarlink.classList.remove('active')
      }
    })
  }
  window.addEventListener('load', navbarlinksActive)
  onscroll(document, navbarlinksActive)

  /**
   * Toggle .header-scrolled class to #header when page is scrolled
   */
  let selectHeader = select('#header')
  if (selectHeader) {
    const headerScrolled = () => {
      if (window.scrollY > 100) {
        selectHeader.classList.add('header-scrolled')
      } else {
        selectHeader.classList.remove('header-scrolled')
      }
    }
    window.addEventListener('load', headerScrolled)
    onscroll(document, headerScrolled)
  }

  /**
   * Back to top button
   */
  let backtotop = select('.back-to-top')
  if (backtotop) {
    const toggleBacktotop = () => {
      if (window.scrollY > 100) {
        backtotop.classList.add('active')
      } else {
        backtotop.classList.remove('active')
      }
    }
    window.addEventListener('load', toggleBacktotop)
    onscroll(document, toggleBacktotop)
  }

  /**
   * Initiate tooltips
   */
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  /**
   * Initiate quill editors
   */
  if (select('.quill-editor-default')) {
    new Quill('.quill-editor-default', {
      theme: 'snow'
    });
  }

  if (select('.quill-editor-bubble')) {
    new Quill('.quill-editor-bubble', {
      theme: 'bubble'
    });
  }

  if (select('.quill-editor-full')) {
    new Quill(".quill-editor-full", {
      modules: {
        toolbar: [
          [{
            font: []
          }, {
            size: []
          }],
          ["bold", "italic", "underline", "strike"],
          [{
              color: []
            },
            {
              background: []
            }
          ],
          [{
              script: "super"
            },
            {
              script: "sub"
            }
          ],
          [{
              list: "ordered"
            },
            {
              list: "bullet"
            },
            {
              indent: "-1"
            },
            {
              indent: "+1"
            }
          ],
          ["direction", {
            align: []
          }],
          ["link", "image", "video"],
          ["clean"]
        ]
      },
      theme: "snow"
    });
  }

  /**
   * Initiate TinyMCE Editor
   */

  var useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;

  tinymce.init({
    selector: 'textarea.tinymce-editor',
    plugins: 'print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
    imagetools_cors_hosts: ['picsum.photos'],
    menubar: 'file edit view insert format tools table help',
    toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
    toolbar_sticky: true,
    autosave_ask_before_unload: true,
    autosave_interval: '30s',
    autosave_prefix: '{path}{query}-{id}-',
    autosave_restore_when_empty: false,
    autosave_retention: '2m',
    image_advtab: true,
    link_list: [{
        title: 'My page 1',
        value: 'https://www.tiny.cloud'
      },
      {
        title: 'My page 2',
        value: 'http://www.moxiecode.com'
      }
    ],
    image_list: [{
        title: 'My page 1',
        value: 'https://www.tiny.cloud'
      },
      {
        title: 'My page 2',
        value: 'http://www.moxiecode.com'
      }
    ],
    image_class_list: [{
        title: 'None',
        value: ''
      },
      {
        title: 'Some class',
        value: 'class-name'
      }
    ],
    importcss_append: true,
    file_picker_callback: function(callback, value, meta) {
      /* Provide file and text for the link dialog */
      if (meta.filetype === 'file') {
        callback('https://www.google.com/logos/google.jpg', {
          text: 'My text'
        });
      }

      /* Provide image and alt text for the image dialog */
      if (meta.filetype === 'image') {
        callback('https://www.google.com/logos/google.jpg', {
          alt: 'My alt text'
        });
      }

      /* Provide alternative source and posted for the media dialog */
      if (meta.filetype === 'media') {
        callback('movie.mp4', {
          source2: 'alt.ogg',
          poster: 'https://www.google.com/logos/google.jpg'
        });
      }
    },
    templates: [{
        title: 'New Table',
        description: 'creates a new table',
        content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
      },
      {
        title: 'Starting my story',
        description: 'A cure for writers block',
        content: 'Once upon a time...'
      },
      {
        title: 'New list with dates',
        description: 'New List with dates',
        content: '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
      }
    ],
    template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
    template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
    height: 600,
    image_caption: true,
    quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
    noneditable_noneditable_class: 'mceNonEditable',
    toolbar_mode: 'sliding',
    contextmenu: 'link image imagetools table',
    skin: useDarkMode ? 'oxide-dark' : 'oxide',
    content_css: useDarkMode ? 'dark' : 'default',
    content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
  });

  /**
   * Initiate Bootstrap validation check
   */
  var needsValidation = document.querySelectorAll('.needs-validation')

  Array.prototype.slice.call(needsValidation)
    .forEach(function(form) {
      form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })

  /**
   * Initiate Datatables
   */
  const datatables = select('.datatable', true)
  datatables.forEach(datatable => {
    new simpleDatatables.DataTable(datatable, {
      paging: false,
      perPageSelect: false
    });
  })


  /**
   * Autoresize echart charts
   */
  const mainContainer = select('#main');
  if (mainContainer) {
    setTimeout(() => {
      new ResizeObserver(function() {
        select('.echart', true).forEach(getEchart => {
          echarts.getInstanceByDom(getEchart).resize();
        })
      }).observe(mainContainer);
    }, 200);
  }

  /**
   * Self written javascript
   */
  $("#btnSaveFlightDelayRecord").click(function(){
    var pageContext = $("#PageContent").val();
    var url = pageContext+"/flightdelay_show/page/1/10/sort/flightId/0";
    $(location).attr("href",url);
  })

  $("#reportForm").off('submit').on('submit', function(e) {
    var reportTitle = $("#inputReportTitle").val();
    var departmentName = $("#inputDepartmentName").val();
    var fromDate = $("#inputFromDate").val();
    var toDate = $("#inputToDate").val();

    var reportParameter = new Array(4);
    reportParameter[0] = reportTitle;
    reportParameter[1] = departmentName;
    reportParameter[2] = fromDate;
    reportParameter[3] = toDate;

    var pageContext = $("#PageContent").val();
    var url = pageContext+"/printReport";

    $.ajax({
      "url": url,
      type: "post",
      contentType:"application/json",
      dataType:"json",
      data:JSON.stringify(reportParameter),
      success: function(data) {
      }
    });
  })

  /**
   * Delete flight delay record
   */
  $(".deleteFlightDelay").off('click').on('click', function(){
    var deleteId = $(this).data("flight-id");
    var pageContext = $("#PageContent").val();
    var url = pageContext + "/flightdelay_manage/delete/" + deleteId;

    console.log(deleteId);

    $("#btnConfirmDelete").click(function(){
      $.ajax({
        "url": url,
        type: "get",
        success: function(data){
          window.location.reload();
        }
      });
    })
  })

  /**
    * Insert flight delay record
   */
  $("#formAddRecord").submit(function(e){
    var flightdelay = new Object();

    var date = $("#inputDateDay").val();
    var d = date.split('-');
    flightdelay.year = new Date(date).getFullYear();
    flightdelay.month = d[1];
    flightdelay.day = d[2];
    flightdelay.dayOfWeek = new Date(date).getDay();
    flightdelay.sourceAirportIATA = $("#inputSrcAirport").val();
    flightdelay.destAirportIATA = $("#inputDestAirport").val();
    flightdelay.scheduledDeparture = $("#inputScheduledDeparture").val();
    flightdelay.departureDelay = $("#inputDepartureDelay").val();
    flightdelay.taxiOut = $("#inputTaxiOut").val();
    flightdelay.wheelsOff = $("#inputWheelsOff").val();
    flightdelay.scheduledTime = $("#inputScheduledTime").val();
    flightdelay.airTime = $("#inputAirTime").val();
    flightdelay.distance = $("#inputDistance").val();
    flightdelay.wheelsOn = $("#inputWheelsOn").val();
    flightdelay.taxiIn = $("#inputTaxiIn").val();
    flightdelay.scheduledArrival = $("#inputScheduledArrival").val();
    if($("#checkDiverted").is(":checked") == 1){
      flightdelay.diverted = true;
    }
    else{
      flightdelay.diverted = false;
    }
    if($("#checkCancelled").is(":checked") == 1){
      flightdelay.cancelled = true;
    }
    else {
      flightdelay.cancelled = false;
    }
    for(var i=1;i<=4;i++){
      if($("#checkCancellationReason"+i).is(":checked") == 1){
        flightdelay.cancellationReason = $("#checkCancellationReason"+i).val();
      }
    }
    flightdelay.airSysDelay = $("#inputAirSysDelay").val();
    flightdelay.securityDelay = $("#inputSecurityDelay").val();
    flightdelay.airlineDelay = $("#inputAirlineDelay").val();
    flightdelay.lateAircraftDelay = $("#inputLateAircraftDelay").val();
    flightdelay.weatherDelay = $("#inputWeatherDelay").val();
    flightdelay.tailNumber = $("#inputTailNum").val();
    flightdelay.airlineIATA = $("#inputAirlineIATA").val();

    var pageContext = $("#PageContent").val();
    var url = pageContext + "/flightdelay_manage/insert";
    $.ajax({
      "url": url,
      type: "post",
      contentType:"application/json",
      dataType:"json",
      data:JSON.stringify(flightdelay),
      success: function(data) {
      }
    });
  })

  /**
   * Update flight delay record
   */
  $(".editFlightDelay").off('click').on('click', function(e){
    var updateId = $(this).data("flight-id");

    var pageContext = $("#PageContent").val();
    var url = pageContext + "/flightdelay_manage/searchById/" + updateId;

    $.ajax({
      "url": url,
      type: "post",
      success: function(data) {
        var date = data.year+"-"+(data.month>9?data.month:'0'+data.month)+"-"+(data.day>9?data.day:'0'+data.day);
        $("#inputNewDateDay").attr('value',date);
        $("#inputNewTailNum").val(data.tailNumber);
        $("#inputNewSrcAirport").val(data.sourceAirportIATA);
        $("#inputNewDestAirport").val(data.destAirportIATA);
        $("#inputNewScheduledDeparture").val(data.scheduledDeparture);
        $("#inputNewWheelsOff").val(data.wheelsOff);
        $("#inputNewDepartureDelay").val(data.departureDelay);
        $("#inputNewTaxiOut").val(data.taxiOut);
        $("#inputNewScheduledTime").val(data.scheduledTime);
        $("#inputNewAirTime").val(data.airTime);
        $("#inputNewDistance").val(data.distance);
        $("#inputNewTaxiIn").val(data.taxiIn);
        $("#inputNewScheduledArrival").val(data.scheduledArrival);
        $("#inputNewWheelsOn").val(data.wheelsOn);
        data.diverted ? $("#checkNewDiverted").get(0).checked = true : $("#checkNewDiverted").get(0).checked = false;
        data.cancelled ? $("#checkNewCancelled").get(0).checked = true : $("#checkNewCancelled").get(0).checked = false;
        if(data.cancellationReason != null){
          if(data.cancellationReason === 'A')$("checkNewCancellationReason1").get(0).checked = true;
          if(data.cancellationReason === 'B')$("checkNewCancellationReason2").get(0).checked = true;
          if(data.cancellationReason === 'C')$("checkNewCancellationReason3").get(0).checked = true;
          if(data.cancellationReason === 'D')$("checkNewCancellationReason4").get(0).checked = true;
        }
        $("#inputNewAirlineIATA").val(data.airlineIATA);
        $("#inputNewAirSysDelay").val(data.airSysDelay);
        $("#inputNewSecurityDelay").val(data.securityDelay);
        $("#inputNewAirlineDelay").val(data.airlineDelay);
        $("#inputNewLateAircraftDelay").val(data.lateAircraftDelay);
        $("#inputNewWeatherDelay").val(data.weatherDelay);
      }
    });

    $("#formEditRecord").off('submit').on('submit', function(e){
      var pageContext = $("#PageContent").val();
      var url = pageContext + "/flightdelay_manage/update/" + updateId;

      var flightdelay = new Object();

      var date = $("#inputNewDateDay").val();
      var d = date.split('-');
      flightdelay.year = new Date(date).getFullYear();
      flightdelay.month = d[1];
      flightdelay.day = d[2];
      flightdelay.dayOfWeek = new Date(date).getDay();
      flightdelay.sourceAirportIATA = $("#inputNewSrcAirport").val();
      flightdelay.destAirportIATA = $("#inputNewDestAirport").val();
      flightdelay.scheduledDeparture = $("#inputNewScheduledDeparture").val();
      flightdelay.departureDelay = $("#inputNewDepartureDelay").val();
      flightdelay.taxiOut = $("#inputNewTaxiOut").val();
      flightdelay.wheelsOff = $("#inputNewWheelsOff").val();
      flightdelay.scheduledTime = $("#inputNewScheduledTime").val();
      flightdelay.airTime = $("#inputNewAirTime").val();
      flightdelay.distance = $("#inputNewDistance").val();
      flightdelay.wheelsOn = $("#inputNewWheelsOn").val();
      flightdelay.taxiIn = $("#inputNewTaxiIn").val();
      flightdelay.scheduledArrival = $("#inputNewScheduledArrival").val();
      if($("#checkNewDiverted").is(":checked")){
        flightdelay.diverted = true;
      }else flightdelay.diverted = false;
      if($("#checkNewCancelled").is(":checked")){
        flightdelay.cancelled = true;
      }else flightdelay.cancelled = false;
      for(var i=1;i<=4;i++){
        if($("#checkNewCancellationReason"+i).is(":checked") === 1){
          flightdelay.cancellationReason = $("#checkNewCancellationReason"+i).val();
        }
      }
      flightdelay.airSysDelay = $("#inputNewAirSysDelay").val();
      flightdelay.securityDelay = $("#inputNewSecurityDelay").val();
      flightdelay.airlineDelay = $("#inputNewAirlineDelay").val();
      flightdelay.lateAircraftDelay = $("#inputNewLateAircraftDelay").val();
      flightdelay.weatherDelay = $("#inputNewWeatherDelay").val();
      flightdelay.tailNumber = $("#inputNewTailNum").val();
      flightdelay.airlineIATA = $("#inputNewAirlineIATA").val();

      $.ajax({
        "url": url,
        type: "post",
        contentType:"application/json",
        dataType:"json",
        data:JSON.stringify(flightdelay),
        success: function(data) {
          console.log("Receive data...");
        }
      });
    })
  })

  // if($("#DuplicateRecordMessage").val()!=""){
  //   alert("Failed to insert record! Error: "+$("#DuplicateRecordMessage").val());
  // }
  // else{
  // }

  /**
   * Search flight delay record - Table
   */
  $("#formSearch").off('submit').on('submit',function(e){
    e.preventDefault();

    var flightDelay = new Array(5);
    flightDelay[0] = $("#floatingFromDate").val();
    flightDelay[1] = $("#floatingToDate").val();
    flightDelay[2] = $("#floatingSrcAirport").val();
    flightDelay[3] = $("#floatingDestAirport").val();
    flightDelay[4] = $("#floatingTailNumber").val();

    var pageContext = $("#PageContent").val();
    var url = pageContext + "/flightdelay_search/view_search";

    $.ajax({
      "url": url,
      type: "post",
      contentType:"application/json",
      dataType:"json",
      data: JSON.stringify(flightDelay),
      success: function(data) {
        $("#resultModalBody tbody").html('');
        for(var i=0;i<data.length;i++){
          var html = '<tr><th scope="row">'+data[i].flightId+'</th>';
          html += '<td>'+data[i].year+'-'+data[i].month+'-'+data[i].day+'</td>';
          html += '<td>'+data[i].tailNumber+'</td>';
          html += '<td>'+data[i].airlineIATA+'</td>';
          html += '<td>'+data[i].sourceAirportIATA+'</td>';
          html += '<td>'+data[i].destAirportIATA+'</td>';
          html += '<td>'+data[i].scheduledDeparture+'</td>';
          html += '<td>'+data[i].departureTime+'</td>';
          html += '<td>'+data[i].departureDelay+'</td>';
          html += '<td>'+data[i].taxiOut+'</td>';
          html += '<td>'+data[i].wheelsOff+'</td>';
          html += '<td>'+data[i].scheduledTime+'</td>';
          html += '<td>'+data[i].elapsedTime+'</td>';
          html += '<td>'+data[i].airTime+'</td>';
          html += '<td>'+data[i].distance+'</td>';
          html += '<td>'+data[i].wheelsOn+'</td>';
          html += '<td>'+data[i].taxiIn+'</td>';
          html += '<td>'+data[i].scheduledArrival+'</td>';
          html += '<td>'+data[i].arrivalTime+'</td>';
          html += '<td>'+data[i].arrivalDelay+'</td>';
          html += '<td>'+data[i].diverted+'</td>';
          html += '<td>'+data[i].cancelled+'</td>';
          html += '<td>'+data[i].cancellationReason+'</td>';
          html += '<td>'+data[i].airSysDelay+'</td>';
          html += '<td>'+data[i].securityDelay+'</td>';
          html += '<td>'+data[i].airlineDelay+'</td>';
          html += '<td>'+data[i].lateAircraftDelay+'</td>';
          html += '<td>'+data[i].weatherDelay+'</td>';
          html += '</tr>';

          $("#resultModalBody tbody").html($("#resultModalBody tbody").html()+html);
        }
        $("#modalGenerateReport").modal('show');
      }
    });
  })

  /**
   * Search flight delay record - Graph
   */
  $("#generateGraph").off('click').on('click',function(e){
    var barMonth = $("#floatingSelectBarChart").val();
    var pieMonth = $("#floatingSelectPieChart").val();

    var pageContext = $("#PageContent").val();
    var url = pageContext + "/flightdelay_search/view_search";

    if(barMonth!='' || pieMonth!='') {
      if(barMonth==''){
        $(location).attr("href",url + '/graph/month/' + '0' + '&' + pieMonth);
      }
      if(pieMonth==''){
        $(location).attr("href",url + '/graph/month/' + barMonth + '&' + '0');
      }
      if(barMonth!='' && pieMonth!='') {
        $(location).attr("href", url + '/graph/month/' + barMonth + '&' + pieMonth);
      }
    }
  })

  /**
   * Pagination, Sorting, Page Resize
   */
  $("#sortByCol1, #btnResizePage1").off('click').on('click',function(e){
    var selectCol = $("#selectSortCol option:selected").val();
    var ascDesc = $("#selectAscDesc option:selected").val();
    var pageSize = $("#inputPageSize1").val();

    var pageContext = $("#PageContent").val();
    var currentPage = $("#currentPageNum").val();
    var url = pageContext+"/flightdelay_show/page/"+currentPage+"/"+pageSize+"/sort/"+selectCol+"/"+ascDesc;
    $(location).attr("href",url);
  })

  $("#sortByCol2, #btnResizePage2").off('click').on('click',function(e){
    var selectCol = $("#selectSortCol option:selected").val();
    var ascDesc = $("#selectAscDesc option:selected").val();
    var pageSize = $("#inputPageSize2").val();

    var pageContext = $("#PageContent").val();
    var currentPage = $("#currentPageNum").val();
    var url = pageContext+"/flightdelay_manage/page/"+currentPage+"/"+pageSize+"/sort/"+selectCol+"/"+ascDesc;
    $(location).attr("href",url);
  })

})();