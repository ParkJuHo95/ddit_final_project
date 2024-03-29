<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner row justify-content-md-center">
          <!-- Register -->
          <div class="card col-4" style="height: 90vh">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href='<c:url value="/"/>' class="app-brand-link gap-2">
                  <img src='<c:url value="/resources/WareBridge_coral.png"/>'>
                  <span class="app-brand-text demo text-body fw-bolder">wareBridge</span>
                </a>
              </div>
              <!-- /Logo -->	
<%-- action="<%=request.getContextPath() %>/home" --%>
              <form class="mb-3"  method="post" id="loginForm">
                <div class="mb-3">
                  <label for="email" class="form-label">아이디(사번)</label>
                  <input
                    type="text"
                    class="form-control"
                    name="username"
                    placeholder="아이디(사번)을 입력해주세요."
                    autofocus
                  />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">비밀번호</label>
                    <a href='<c:url value="/login/lostPw"/>'>
                      <small>비밀번호 찾기</small>
                    </a>
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      class="form-control"
                      name="password"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="rememberMe" value="remember-me" id="flexCheckDefault" />
                    <label class="form-check-label" for="remember-me">아이디 기억하기</label>
                  </div>
                </div>
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
                </div>
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="button"  data-bs-toggle="modal" data-bs-target="#imageToLoginModal">얼굴인식 로그인</button>
                </div>
              </form>
			    <div class="modal fade" id="imageToLoginModal" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content border border-primary">
							<div class="modal-header">
								<video id="video" width="510" height="480" autoplay></video>
							</div>
							<div class="modal-footer row">
								<input type='button' class="btn btn-primary" onclick="captureAndSend()" value="로그인"/>
								<input type='button' class="btn btn-primary closeModalBtn" data-bs-dismiss="modal" style="display: none"/>
							</div>
						</div>
					</div>
				</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<script type="text/javascript">

	function captureAndSend() {
	    canvas.width = video.videoWidth;
	    canvas.height = video.videoHeight;
	    context.drawImage(video, 0, 0, canvas.width, canvas.height);
	    canvas.toBlob(function(blob) {
	    	if(formData.get('file')) formData.delete('file');
			formData.append('file', blob, 'image.jpg');
			$.ajax({
// 	        	url: "http://127.0.0.1:5000/cam_capture_check.ajax",
	        	url: "http://192.168.141.18:5000/cam_capture_check.ajax",
				processData: false,
				contentType: false,
				data: formData,
				type: "POST",
				success: function(resp) {
					
					if(resp.resultId == "fail") {
						toastr.warning("인식 실패 다시 시도해주세요");
						return false;
					}
					
					empId = resp.resultId.trim();
					empPass = resp.resultPass.trim();
					$('input[name=username]').val(empId);
					$('input[name=password]').val(empPass);
					$('.closeModalBtn').click();
					$('#loginForm').submit();
		    	}
    		});
		}, 'image/jpeg', 0.9);
  	}

	var video = document.getElementById('video');
    var canvas = document.createElement('canvas');
    var context = canvas.getContext('2d');
    var formData = new FormData();

    navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
		video.srcObject = stream;
		video.play();
    })
    .catch(function(error) {
    	console.error(error);
    });


</script>

    
