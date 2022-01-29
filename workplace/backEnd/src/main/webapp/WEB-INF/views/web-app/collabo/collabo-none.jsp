<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <!-- page content -->
      <div class="right_col" role="main">
        <!-- 프로젝트 바디 시작 -->
        <div class="x_panel">

          <div class="x_title">
            <h2><img src="https://img.icons8.com/ios/30/000000/handshake--v2.png" /> 콜라보 프로젝트</h2>
            <div class="clearfix"></div>
          </div>

          <div class="x_content">

            <div class="tab-content" id="myTabContent">
              <div class="container body">
                <div class="main_container">
                  <!-- page content -->
                  <div class="col-md-12">
                    <div class="col-middle">
                      <div class="d-flex justify-content-center">
                        <img src="https://img.icons8.com/color/150/000000/teamwork--v1.png"/>
                      </div>
                      <br>
                      <p class="text-center">콜라보 하고 싶은 다양한 프로젝트 및 유저들을 검색해보세요.</p>

                      <style>
                        /* 자동 완성창 덮는 것 */
                        .autocomplete-items {
                          position: absolute;
                          border: 1px solid #d4d4d4;
                          border-bottom: none;
                          border-top: none;
                          z-index: 99;
                          /*position the autocomplete items to be the same width as the container:*/
                          top: 100%;
                          left: 0;
                          right: 0;
                        }

                        /* 자동 완성창 CSS */
                        .autocomplete-items div {
                          padding: 10px;
                          cursor: pointer;
                          background-color: #fff;
                          border-bottom: 1px solid #d4d4d4;
                        }

                        /* 자동 완성창 hover*/
                        .autocomplete-items div:hover {
                          background-color: #e9e9e9;
                        }

                        /*when navigating through the items using the arrow keys:*/
                        .autocomplete-active {
                          background-color: DodgerBlue !important;
                          color: #ffffff;
                        }
                      </style>
                      
                      <!-- search 시작 -->
                      <div class="flex-column">
                        <!-- search-bar 시작-->
                        <div class="mid_center d-flex justify-content-center">
                          <div class="collabo search-box">

                            <form autocomplete="off" action="/action_page.php">
                              <button class="btn-search">
                                <i class="fa fa-search"></i>
                              </button>
                              <input type="text" class="input-search collabo" id="myInput" onkeyup="myFunction()"
                                placeholder="프로젝트명 또는 닉네임을 입력해주세요...">
                            </form>
                          </div>

                        </div>
                        <!-- search-bar 끝-->
                      </div>


                      <!-- carousel 시작 -->
                      <div class="row">
                        <!-- 프로젝트 추천 carousel-->
                        <div id="demo" class="carousel slide col-md-6" data-ride="carousel" data-interval="false">
                          <!-- Indicators -->
                          <!-- <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                            <li data-target="#demo" data-slide-to="3"></li>
                            <li data-target="#demo" data-slide-to="4"></li>
                          </ul> -->
                          <!-- The slideshow -->
                          <div class="carousel-inner">
                            <div class="carousel-item active">

                              <div class="card">
                                <div class="card-body coll-none">
                                  <h5 class="card-title"><a href="#" class="spoonCard">Sample 추천 프로젝트명</a></h5>
                                  <p>프로젝트 한 줄 소개 위치 할 곳</p>
                                  
                                  <div class="card-collabo d-flex justify-content-between">

                                    <div class="d-flex align-items-center">
                                      <span><img
                                          src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
                                      <h4 class="mb-0"><span class="badge badge-success ml-3">카테고리 예시</span></h4>
                                    </div>

                                    <div>

                                      <ul class="list-inline d-flex ">
                                        <li>
                                          <img src="images/user.png" class="avatar" alt="">
                                        </li>
                                        <li>
                                          <img src="images/user.png" class="avatar" alt="">
                                        </li>
                                        <li>
                                          <img src="images/user.png" class="avatar" alt="">
                                        </li>
                                        <li>
                                          <img src="images/user.png" class="avatar" alt="">
                                        </li>
                                      </ul>
                                    </div>
                                  </div>

                                </div>
                              </div>

                            </div>
                            <div class="carousel-item">

                              <div class="card">
                                <div class="card-body coll-none">
                                  <h5 class="card-title"><a href="#" class="spoonCard">Probada 프로젝트</a></h5>
                                  <p>리얼혁과 함께하는 즐거운 프로젝트!</p>

                                  <div class="card-collabo d-flex flex-column">
                                    <ul class="list-inline">
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                    </ul>
                                  </div>

                                  <div class="d-flex align-items-center">
                                    <span><img
                                        src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />180</span>
                                    <h4 class="mb-0"><span class="badge badge-success ml-3">java</span></h4>
                                  </div>
                                </div>
                              </div>

                            </div>

                            <div class="carousel-item">

                              <div class="card">
                                <div class="card-body coll-none">
                                  <h5 class="card-title"><a href="#" class="spoonCard">BangBangGokGok</a></h5>
                                  <p>곡소리 나는 프로젝트</p>

                                  <div class="card-collabo d-flex flex-column">
                                    <ul class="list-inline">
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                      <li>
                                        <img src="images/user.png" class="avatar" alt="">
                                      </li>
                                    </ul>
                                  </div>

                                  <div class="d-flex align-items-center">
                                    <span><img
                                        src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
                                    <h4 class="mb-0"><span class="badge badge-success ml-3">javascript</span></h4>
                                  </div>
                                </div>
                              </div>

                            </div>


                            <!-- 우측 캐러셀 버튼 Left and right controls -->
                            <a class="carousel-control-prev coll-none" href="#demo" data-slide="prev">
                              <span class="carousel-control-prev-icon" style="background-color:black"></span>
                            </a>
                            <a class="carousel-control-next coll-none" href="#demo" data-slide="next">
                              <span class="carousel-control-next-icon" style="background-color:black"></span>
                            </a>
                          </div>
                        </div>

                        <!-- 우측 사람 추천 carousel-->
                        <div id="demo1" class="carousel slide col-md-6" data-ride="carousel" data-interval="false">

                          <!-- Indicators -->
                          <!-- <ul class="carousel-indicators">
                            <li data-target="#demo1" data-slide-to="0" class="active"></li>
                            <li data-target="#demo1" data-slide-to="1"></li>
                            <li data-target="#demo1" data-slide-to="2"></li>
                          </ul> -->

                          <!-- The slideshow -->
                          <div class="carousel-inner">
                            <div class="carousel-item active">

                              <div class="card">
                                <div class="well profile_view collabo-none d-block w-100">
                                  <div class="col-sm-12">
                                    <h4 class="brief"><i>pooh_00@naver.com</i></h4>
                                    <div class="left col-md-7 col-sm-7">
                                      <h2>석기현</h2>
                                      <p>50자 이내로 작성한 소개글</p>
                                      <ul class="list-unstyled">

                                      </ul>
                                    </div>
                                    <div class="right col-md-5 col-sm-5 text-center">
                                      <img src="/webapp/resources/asserts/images/img.jpg" alt=""
                                        class="img-circle img-fluid">
                                    </div>
                                  </div>
                                  <div class=" row">
                                    <div class="">

                                      <div class="row ml-3">
                                        <i class="fa fa-heart fa-2x">30</i>
                                        <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i
                                            class="fa fa-user"> </i> View Profile </button>
                                      </div>
                                    </div>

                                  </div>
                                </div>

                              </div>
                            </div>
                            <div class="carousel-item">

                              <div class="card">

                                <div class="well profile_view collabo-none d-block w-100">
                                  <div class="col-sm-12">
                                    <h4 class="brief"><i>pooh_00@naver.com</i></h4>
                                    <div class="left col-md-7 col-sm-7">
                                      <h2>석기현</h2>
                                      <p>50자 이내로 작성한 소개글</p>
                                      <ul class="list-unstyled">

                                      </ul>
                                    </div>
                                    <div class="right col-md-5 col-sm-5 text-center">
                                      <img src="/webapp/resources/asserts/images/img.jpg" alt=""
                                        class="img-circle img-fluid">
                                    </div>
                                  </div>
                                  <div class=" row">
                                    <div class="">

                                      <div class="row ml-3">
                                        <i class="fa fa-heart fa-2x">30</i>
                                        <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i
                                            class="fa fa-user"> </i> View Profile </button>
                                      </div>
                                    </div>

                                  </div>
                                </div>

                              </div>
                            </div>
                            <div class="carousel-item">

                              <div class="card">

                                <div class="well profile_view collabo-none d-block w-100">
                                  <div class="col-sm-12">
                                    <h4 class="brief"><i>pooh_00@naver.com</i></h4>
                                    <div class="left col-md-7 col-sm-7">
                                      <h2>석기현</h2>
                                      <p>50자 이내로 작성한 소개글</p>
                                      <ul class="list-unstyled">

                                      </ul>
                                    </div>
                                    <div class="right col-md-5 col-sm-5 text-center">
                                      <img src="/webapp/resources/asserts/images/img.jpg" alt=""
                                        class="img-circle img-fluid">
                                    </div>
                                  </div>
                                  <div class=" row">
                                    <div class="">

                                      <div class="row ml-3">
                                        <i class="fa fa-heart fa-2x">30</i>
                                        <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i
                                            class="fa fa-user"> </i> View Profile </button>
                                      </div>
                                    </div>

                                  </div>
                                </div>

                              </div>
                            </div>
                            <!-- 우측 캐러셀 버튼 Left and right controls -->

                            <a class="carousel-control-prev coll-none" href="#demo1" data-slide="prev">
                              <span class="carousel-control-prev-icon" style="background-color:black"></span>
                            </a>
                            <a class="carousel-control-next coll-none" href="#demo1" data-slide="next">
                              <span class="carousel-control-next-icon" style="background-color:black"></span>
                            </a>
                          </div>
                        </div>

                      </div>
                      <!-- 맨 위 캐러셀 끝 -->
                      <br>
                      <p class="text-center">콜라보 하고 싶은 프로젝트의 리더에게 제안해보세요.</p>
                      <div class="mid_center d-flex justify-content-center">
                        <div class="btn create-btn collabo-none-btn" data-toggle="modal" data-target="#createCollabo">
                          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                            class="bi bi-plus" viewBox="0 0 16 16">
                            <path
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                              class="cQfklM" />
                          </svg>
                        </div>
                      </div>
                    </div>
                    <!-- /page content -->
                  </div>
                </div>
              </div>

            </div>

          </div>
          <!-- 프로젝트 바디 끝 -->
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Copyright © 2022 <a href="<%=request.getContextPath()%>/probada.com/index"
              style="color: #73879C;">probada</a>
            App Company. All Rights Reserved.
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>

    <!-- include -->
    <script>includeHTML();</script>
    <!-- jQuery -->
    <script src="/webapp/resources/bootstrap/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/webapp/resources/bootstrap/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="/webapp/resources/bootstrap/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/webapp/resources/bootstrap/vendors/nprogress/nprogress.js"></script>
    <!-- ECharts -->
    <script src="/webapp/resources/bootstrap/vendors/echarts/dist/echarts.min.js"></script>
    <script src="/webapp/resources/bootstrap/vendors/echarts/map/js/world.js"></script>
    <!-- morris.js -->
    <script src="/webapp/resources/bootstrap/vendors/raphael/raphael.min.js"></script>
    <script src="/webapp/resources/bootstrap/vendors/morris.js/morris.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/webapp/resources/bootstrap/build/js/custom.min.js"></script>



    <!-- The Modal -->
    <div class="modal" id="createCollabo" data-backdrop="static">
      <div class="modal-dialog">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title modalTitle">콜라보 제안</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>

          </div>

          <!-- Modal body -->
          <div class="modal-body">

            <div class="x_content">
              <!-- form start -->
              <form>
                <p>콜라보 제안은 다른 프로젝트 팀과 협업 할 수 있는 곳입니다.</p>
                <p>다른 팀과 협업 공간을 만들고 함께 일해보세요.</p>
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">이메일로 초대</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="상대방의 이메일을 입력하세요.">
                  </div>
                  <!-- select -->
                  <div class="form-group">
                    <label>접근 권한</label>
                    <select class="form-control">
                      <option value="" disabled selected hidden>접근 권한을 설정해 주세요.</option>
                      <option>Observer</option>
                      <option>Cooperator</option>
                      <option>Partner</option>
                      <option>Collaborator</option>
                    </select>
                  </div>
                  <!-- textarea -->
                  <div class="form-group">
                    <label>보낼 메세지</label>
                    <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
                  </div>
                </div>
                <!-- /.card-body -->
                <button type="submit" class="btn  btn-outline-primary collabo-submit-btn">보내기</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 콜라보 제안 모달 끝-->

    <script>
      function autocomplete(inp, arr) {
        /*the autocomplete function takes two arguments,
        the text field element and an array of possible autocompleted values:*/
        var currentFocus;
        /*execute a function when someone writes in the text field:*/
        inp.addEventListener("input", function (e) {
          var a, b, i, val = this.value;
          /*close any already open lists of autocompleted values*/
          closeAllLists();
          if (!val) { return false; }
          currentFocus = -1;
          /*create a DIV element that will contain the items (values):*/
          /* 추천 검색 div 생성 */
          a = document.createElement("DIV");
          a.setAttribute("id", this.id + "autocomplete-list");
          a.setAttribute("class", "autocomplete-items overflow-auto");
          a.setAttribute("style", "height:300px;");
          /*append the DIV element as a child of the autocomplete container:*/
          this.parentNode.appendChild(a);
          /*for each item in the array...*/
          for (i = 0; i < arr.length; i++) {

            /*check if the item starts with the same letters as the text field value:*/
            if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
              /*create a DIV element for each matching element:*/
              b = document.createElement("DIV");
              /*make the matching letters bold:*/
              b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
              b.innerHTML += arr[i].substr(val.length);
              /*insert a input field that will hold the current array item's value:*/
              b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
              /*execute a function when someone clicks on the item value (DIV element):*/
              b.addEventListener("click", function (e) {
                /*insert the value for the autocomplete text field:*/
                inp.value = this.getElementsByTagName("input")[0].value;
                /*close the list of autocompleted values,
                (or any other open lists of autocompleted values:*/
                closeAllLists();
              });
              a.appendChild(b);
            }
          }
        });
        /*execute a function presses a key on the keyboard:*/
        inp.addEventListener("keydown", function (e) {
          var x = document.getElementById(this.id + "autocomplete-list");
          if (x) x = x.getElementsByTagName("div");
          if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
          } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
          } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
              /*and simulate a click on the "active" item:*/
              if (x) x[currentFocus].click();
            }
          }
        });
        function addActive(x) {
          /*a function to classify an item as "active":*/
          if (!x) return false;
          /*start by removing the "active" class on all items:*/
          removeActive(x);
          if (currentFocus >= x.length) currentFocus = 0;
          if (currentFocus < 0) currentFocus = (x.length - 1);
          /*add class "autocomplete-active":*/
          x[currentFocus].classList.add("autocomplete-active");
        }
        function removeActive(x) {
          /*a function to remove the "active" class from all autocomplete items:*/
          for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
          }
        }
        function closeAllLists(elmnt) {
          /*close all autocomplete lists in the document,
          except the one passed as an argument:*/
          var x = document.getElementsByClassName("autocomplete-items");
          for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
              x[i].parentNode.removeChild(x[i]);
            }
          }
        }
        /*execute a function when someone clicks in the document:*/
        document.addEventListener("click", function (e) {
          closeAllLists(e.target);
          document.getElementById("myInput").value = "";
        });
      }

      /*An array containing all the country names in the world:*/
      var countries = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua & Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia & Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central Arfrican Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica", "Cote D Ivoire", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Polynesia", "French West Indies", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauro", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Pierre & Miquelon", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "St Kitts & Nevis", "St Lucia", "St Vincent", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor L'Este", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks & Caicos", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Virgin Islands (US)", "Yemen", "Zambia", "Zimbabwe"];

      /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
      autocomplete(document.getElementById("myInput"), countries);

    </script>

  </div>


</body>

</html>