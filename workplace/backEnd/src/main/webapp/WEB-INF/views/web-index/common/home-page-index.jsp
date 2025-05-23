<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>probada</title>
    <link rel="icon" href="<%=request.getContextPath()%>/resources/asserts/images/tab-img.jpg">

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/ddit-vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/asserts/css/common/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/asserts/css/common/animated.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/asserts/css/common/owl.css">
    
  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="./home-page-index.html" class="logo">
              <img src="<%=request.getContextPath()%>/resources/asserts/images/logo.png" alt="probada App">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><a href="#top" class="active">홈</a></li>
              <li class="scroll-to-section"><a href="#services">기능</a></li>
              <li class="scroll-to-section"><a href="#about">probada란?</a></li>
              <li class="scroll-to-section"><a href="#pricing">요금</a></li>
              <!-- <li class="scroll-to-section"><a href="#newsletter">요약</a></li> -->
              <li><div class="gradient-button"><a id="loginBtn" href="./login.html"><i class="fa fa-sign-in-alt"></i> 시작하기</a></div></li> 
            </ul>        
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
  

  <!-- 로그인 모달창 -->
  <div id="modal" class="popupContainer" style="display:none;">
    <div class="popupHeader">
        <span class="header_title">Login</span>
        <span class="modal_close"><i class="fa fa-times"></i></span>
    </div>

    <section class="popupBody">
        <!-- Social Login -->
        <div class="social_login">
            <div class="">
                <a href="#" class="social_box fb">
                    <span class="icon"><i class="fab fa-facebook"></i></span>
                    <span class="icon_title">Connect with Facebook</span>

                </a>

                <a href="#" class="social_box google">
                    <span class="icon"><i class="fab fa-google-plus"></i></span>
                    <span class="icon_title">Connect with Google</span>
                </a>
            </div>

            <div class="centeredText">
                <span>Or use your Email address</span>
            </div>

            <div class="action_btns">
                <div class="one_half"><a href="#" id="login_form" class="btn">Login</a></div>
                <div class="one_half last"><a href="#" id="register_form" class="btn">Sign up</a></div>
            </div>
        </div>

        <!-- Username & Password Login form -->
        <div class="user_login">
            <form>
                <label>Email / Username</label>
                <input type="text" />
                <br />

                <label>Password</label>
                <input type="password" />
                <br />

                <div class="checkbox">
                    <input id="remember" type="checkbox" />
                    <label for="remember">Remember me on this computer</label>
                </div>

                <div class="action_btns">
                    <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
                    <div class="one_half last"><a href="#" class="btn btn_red">Login</a></div>
                </div>
            </form>

            <a href="#" class="forgot_password">Forgot password?</a>
        </div>

        <!-- Register Form -->
        <div class="user_register">
            <form>
                <label>Full Name</label>
                <input type="text" />
                <br />

                <label>Email Address</label>
                <input type="email" />
                <br />

                <label>Password</label>
                <input type="password" />
                <br />

                <div class="checkbox">
                    <input id="send_updates" type="checkbox" />
                    <label for="send_updates">Send me occasional email updates</label>
                </div>

                <div class="action_btns">
                    <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
                    <div class="one_half last"><a href="#" class="btn btn_red">Register</a></div>
                </div>
            </form>
        </div>
    </section>
  </div>

  

  <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <div class="row">
                  <div class="col-lg-12">
                    <h2>쉽고 편리하게 프로젝트를 만들어보세요</h2>
                    <p>probada를 사용하면 세부 정보부터 전반적인 상황까지 업무를 체계적으로 관리하여 팀이 해야 할 일과 중요한 이유 그리고 완료하는 방법을 명확하게 파악할 수 있습니다.</p>
                  </div>
                  <div class="col-lg-12">
                    <div class="white-button first-button scroll-to-section">
                      <!-- <a href="/login.html">시작하기 <i class="fa fa-sign-in-alt"></i></a> -->
                      <li><div class="gradient-button"><a id="loginBtn" href="./login.html">시작하기<i class="fa fa-sign-in-alt"></i></a></div></li> 
                    </div>
                    <!-- <div class="white-button scroll-to-section">
                      <a href="#contact">Free Quote <i class="fab fa-google-play"></i></a>
                    </div> -->
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                <img src="<%=request.getContextPath()%>/resources/asserts/images/slider-dec.svg" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>당신을 위한 <em>쉽고 &amp; 간편한</em> 기능</h4>
            <img src="<%=request.getContextPath()%>/resources/asserts/images/heading-line-dec.png" alt="">
            <p>porbada는 누구나 알아보기 쉬운 디자인으로 사용자에게 새로운 경험을 제공합니다. 심플한 아이콘으로 답답했던 텍스트 형식의 문서 작업 방식을 벗아난 접근 방법, 나만의 개인 작업 공간, 딱딱한 문서 정리를 간단 명료한 간트차트, 비대면을 위한 실시간 채팅 및 온라인 회의까지 이 모든 것들을 여러분에게 제공합니다.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <div class="service-item first-service">
            <div class="icon"></div>
            <h4>심플한 아이콘 디자인!</h4>
            <p>답답한 텍스트 형식의 문서에서 간단하고 깔끔한 아이콘 디자인을 사용해보세요!</p>
            <div class="text-button">
              <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-item second-service">
            <div class="icon"></div>
            <h4>나만의 작업공간!</h4>
            <p>누구에서도 간섭받지 않고 자유롭게 나만의 프로젝트 작업 공간을 만들어보세요!</p>
            <div class="text-button">
              <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-item third-service">
            <div class="icon"></div>
            <h4>문서를 간트차트로!</h4>
            <p>복잡하고 많은 문서를 단 하나의 간단 명료한 간트차트로 확인 할 수 있습니다!</p>
            <div class="text-button">
              <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-item fourth-service">
            <div class="icon"></div>
            <h4>온라인 회의 &amp; 실시간 채팅!</h4>
            <p>문서를 작성하면서 실시간으로 동료와 채팅을! 비대면을 위한 온라인 회의를 진행하세요!</p>
            <div class="text-button">
              <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="about" class="about-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="section-heading">
            <h4><em>probada</em> 란?</h4>
            <img src="<%=request.getContextPath()%>/resources/asserts/images/heading-line-dec.png" alt="">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor incididunt ut labore et dolore magna.</p>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#">심플한 아이콘 디자인</a></h4>
                <p>Lorem Ipsum Text</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#">협업 &amp; 개인</a></h4>
                <p>Lorem Ipsum Text</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#">빠른 일처리</a></h4>
                <p>Lorem Ipsum Text</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#">유연한 작업 수행</a></h4>
                <p>Lorem Ipsum Text</p>
              </div>
            </div>
            <div class="col-lg-12">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor idunte ut labore et dolore adipiscing  magna.</p>
              <div class="border-button mt-3">
                <a href="#">30일 무료 체험하기</a>
              </div>
              <span>* 마창수 33세 축하 기념</span>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="right-image">
            <img src="<%=request.getContextPath()%>/resources/asserts/images/about-right-dec.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="pricing" class="pricing-tables">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>합리적인 <em>요금</em>으로 업무 효율을 높여보세요</h4>
            <img src="<%=request.getContextPath()%>/resources/asserts/images/heading-line-dec.png" alt="">
            <p>*1인 1계정 기준 요금제이며, VAT 제외 금액입니다. <br/>probada는 프로젝트 구성원 제한을 제외한 모든 서비스는 오픈입니다!</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="pricing-item-regular">
            <span class="price">FREE</span>
            <h4>30일 무료 체험</h4>
            <div class="icon">
              <img src="<%=request.getContextPath()%>/resources/asserts/images/pricing-table-01.png" alt="FREE">
            </div>
            <ul>
              <li>무제한 프로젝트</li>
              <li>모든 업무관리</li>
              <li>1:1/그룹 메시징</li>
              <li>온라인회의</li>
              <li>10MB 1회 업로드 용량</li>
              <li class="non-function">프로젝트 구성원 5명 초과</li>
            </ul>
            <div class="border-button">
              <a href="#">시작하기</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <!-- pricing-item-pro -->
          <div class="pricing-item-regular">
            <span class="price">BASIC</span>
            <h4>5,900원/월</h4>
            <div class="icon">
              <img src="<%=request.getContextPath()%>/resources/asserts/images/pricing-table-01.png" alt="BASIC">
            </div>
            <ul>
              <li>무제한 프로젝트</li>
              <li>모든 업무관리</li>
              <li>1:1/그룹 메시징</li>
              <li>온라인회의</li>
              <li>100MB 1회 업로드 용량</li>
              <li class="non-function">프로젝트 구성원 10명 초과</li>
            </ul>
            <div class="border-button">
              <a href="#">시작하기</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="pricing-item-regular">
            <span class="price">PRO</span>
            <h4>9,900원/월</h4>
            <div class="icon">
              <img src="<%=request.getContextPath()%>/resources/asserts/images/pricing-table-01.png" alt="PRO">
            </div>
            <ul>
              <li>무제한 프로젝트</li>
              <li>모든 업무관리</li>
              <li>1:1/그룹 메시징</li>
              <li>온라인회의</li>
              <li>100MB 1회 업로드 용량</li>
              <li>프로젝트 구성원 무제한</li>
            </ul>
            <div class="border-button">
              <a href="#">시작하기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div> 

  <!-- ***** Footer Area Start ***** -->
  <footer id="newsletter">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4 style="text-align: initial;">
              메신저・프로젝트 소통・워크플로우<br/>
              온라인회의까지 ㅡ <br/>
              이 모든 기능을 플로우로 무료로 체험해보세요.
            </h4>
          </div>
        </div>
        <div class="col-lg-6 offset-lg-3">
          <form id="search" action="#" method="GET">
            <div class="row">
              <!-- <div class="col-lg-6 col-sm-6">
                <fieldset>
                  <input type="address" name="address" class="email" placeholder="Email Address..." autocomplete="on" required>
                </fieldset>
              </div> -->
              <div class="col-lg-6 col-sm-6">
                <fieldset>
                  <button type="submit" class="main-button">30일 무료 체험하기<i class="fa fa-angle-right"></i></button>
                </fieldset>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>Contact Us</h4>
            <p>주소 : 대전광역시 중구 대흥동 500-5</p>
            <p><a href="#">전화 : 042-222-8201</a></p>
            <p><a href="#">이메일 : info@company.co</a></p>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>About Us</h4>
            <ul>
              <li><a href="#">홈</a></li>
              <li><a href="#">서비스</a></li>
              <li><a href="#">회사</a></li>
              <li><a href="#">찾아오는 길</a></li>
              <li><a href="#">유료서비스</a></li>
            </ul>
            <ul>
              <li><a href="#">마창수(33)</a></li>
              <li><a href="#">마창수(33)</a></li>
              <li><a href="#">마창수(33)</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>Useful Links</h4>
            <ul>
              <li><a href="#">Free Apps</a></li>
              <li><a href="#">App Engine</a></li>
              <li><a href="#">Programming</a></li>
              <li><a href="#">Development</a></li>
              <li><a href="#">App News</a></li>
            </ul>
            <ul>
              <li><a href="#">App Dev Team</a></li>
              <li><a href="#">Digital Web</a></li>
              <li><a href="#">Normal Apps</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>About Our Company</h4>
            <div class="logo">
              <img src="<%=request.getContextPath()%>/resources/asserts/images/white-logo.png" alt="">
            </div>
            <p>누구나 쉽고 간편하게 사용할 수 있는 프로젝트 관리 시스템을 만들어가는 probada입니다.</p>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="copyright-text">
            <p>Copyright © 2022 probada App Company. All Rights Reserved. 
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- ***** Footer Area End ***** -->


  <!-- Scripts -->
  <script src="<%=request.getContextPath()%>/resources/bootstrap/ddit-vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/ddit-vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/asserts/js/common/owl-carousel.js"></script>
  <script src="<%=request.getContextPath()%>/resources/asserts/js/common/animation.js"></script>
  <script src="<%=request.getContextPath()%>/resources/asserts/js/common/imagesloaded.js"></script>
  <script src="<%=request.getContextPath()%>/resources/asserts/js/common/popup.js"></script>
  <script src="<%=request.getContextPath()%>/resources/asserts/js/common/custom.js"></script>

</body>
</html>