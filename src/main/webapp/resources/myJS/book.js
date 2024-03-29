$(document).off("click", ".cancelBtn")
$(document).on("click", ".cancelBtn", function() {
	var isConfirmed = confirm("정말로 예약을 취소하시겠습니까?");
	var bookCode = $(this).data("bookCode");
	if (isConfirmed) {
		$.ajax({
			type: "POST",
			url: "/WareBridge/admin/book/bookList",
			data: { "bookCode": bookCode },
			success: function(response) {
				toastr.success("예약을 취소하였습니다.");
				innerBodyAjax('/WareBridge/admin/book/bookList');
			},
		});
	} 
});
$(document).off("click", ".userCancelBtn")
$(document).on("click", ".userCancelBtn", function() {
	var isConfirmed = confirm("정말로 예약을 취소하시겠습니까?");
	var bookCode = $(this).data("bookCode");
	if (isConfirmed) {
		$.ajax({
			type: "POST",
			url: "/WareBridge/admin/book/bookList",
			data: { "bookCode": bookCode },
			success: function(response) {
				toastr.success("예약을 취소하였습니다.");
				innerBodyAjax('/WareBridge/user/book/userBookList');
			},
		});
	} 
});
$(document).off("submit", "#bookDetailForm")
$(document).on("submit", "#bookDetailForm", function(event) {
    event.preventDefault();
    var bookDetail = $(this).find('input[name="bookDetail"]').val();;
	let bookCode = $(this).data('bookCode');
	var requestData = {
        bookDetail: bookDetail,
        bookCode: bookCode
    };
	$.ajax({
		type: "POST",
		url:  `${cPath}/user/book/userBookList/modi`,
		data: requestData,
		success: function(response) {
			$('#smallModal').modal('hide');
			console.log(response);
			toastr.success("특이사항이 등록 되었습니다.");
			innerBodyAjax('/WareBridge/user/book/userBookList');
		}
	});
})
$(document).off("submit", "#createForm")
$(document).on("submit", "#createForm", function(event) {
event.preventDefault();
  var data = $(this).serialize();

$.ajax({
	type: "POST",
	url: `${cPath}/admin/book/room`,
	data: data,
	success: function(response) {
		let room = response.room
		let tr =
				`<tr>
  	  <td><span class="fw-medium">${room.roomCode}</span></td>
	  <td>${room.roomName}</td>
	  <td>${room.roomSite}</td>
	  <td>${room.roomDetail}</td>
	  <td><span class="badge bg-label-primary me-1">${room.roomAble}</span></td>
	  <td>
	     <div class="dropdown">
	         <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
	             <i class="bx bx-dots-vertical-rounded"></i>
	         </button>
	         <div class="dropdown-menu">
	             <a class="dropdown-item modification" href="/admin/menuManagement/book/roomChange"> 
	                 <i class="bx bx-edit-alt me-1"></i> 수정
	             </a> 
	             <a class="dropdown-item remove" data-code="${room.roomCode}" data-type="room" data-book-location="/WareBridge/admin/book/deleteRoom"> 
	            <i class="bx bx-trash me-1"></i> 삭제
	        </a>
	         </div>
	     </div>
	 </td>
</tr>`;
			$(roombody).append(tr);
			const bsCollapse = new bootstrap.Collapse('#roomc');
			bsCollapse.hide()
			createForm.reset()
		},
		error: function(error) {
			console.error(error);
		}
	});
});
$(document).off("submit", "#createCarForm")
$(document).on("submit", "#createCarForm", function(event) {
	event.preventDefault();
	var data = $(this).serialize();
	$.ajax({
		type: "POST",
		url: `${cPath}/admin/book/car`,
		data: data,
		success: function(response) {
			let car = response.car
			let tr =
				`<tr>
				<td><span class="fw-medium">${car.carCode}</span></td>
				<td>${car.carName}</td>
				<td>${car.carDetail}</td>
				<td><span class="badge bg-label-primary me-1">${car.carAble}</span></td>
				<td>
					<div class="dropdown">
						<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
							<i class="bx bx-dots-vertical-rounded"></i>
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);"> 
								<i class="bx bx-edit-alt me-1"></i> 수정
							</a> 
							<a class="dropdown-item remove" data-code="${car.carCode}" data-type="car" data-book-location="/WareBridge/admin/book/deleteCar"> 
							    <i class="bx bx-trash me-1"></i> 삭제
							</a>
						</div>
					</div>
				</td>
			</tr>`;
			$(carbody).append(tr);
			const bsCollapse = new bootstrap.Collapse('#carc');
			bsCollapse.hide()
			createCarForm.reset()
		},
		error: function(error) {
			console.error(error);
		}
	});
});
$(document).off("submit", "#createEForm")
$(document).on("submit", "#createEForm", function(event) {
	event.preventDefault();
	var data = $(this).serialize();
	$.ajax({
		type: "POST",
		url: `${cPath}/admin/book/equip`,
		data: data,
		success: function(response) {
			let equip = response.equip
			let tr =
				`<tr>
				<td><span class="fw-medium">${equip.equipCode}</span></td>
				<td>${equip.equipName}</td>
				<td>${equip.equipDetail}</td>
				<td><span class="badge bg-label-primary me-1">${equip.equipAble}</span></td>
				<td>
					<div class="dropdown">
						<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
							<i class="bx bx-dots-vertical-rounded"></i>
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);"> 
								<i class="bx bx-edit-alt me-1"></i> 수정
							</a> 
							<a class="dropdown-item remove" data-code="${equip.equipCode}" data-type="car" data-book-location="/WareBridge/admin/book/deleteCar"> 
							    <i class="bx bx-trash me-1"></i> 삭제
							</a>
						</div>
					</div>
				</td>
			</tr>`;
			$(equipbody).append(tr);
			const bsCollapse = new bootstrap.Collapse('#equipc');
			bsCollapse.hide()
			createEForm.reset()
		},
		error: function(error) {
			console.error(error);
		}
	});
});
$(document).off("click", ".remove")
$(document).on("click", ".remove", function() {
	var isConfirmed = confirm("정말로 삭제하시겠습니까?");
	if (!isConfirmed) {
		return;
	}
	var code = $(this).data("code");
	var type = $(this).data("type");
	var url = $(this).data("bookLocation");
	var dataObject = {};
	switch (type) {
		case "car":
			dataObject = { "carCode": code };
			break;
		case "equip":
			dataObject = { "equipCode": code };
			break;
		case "room":
			dataObject = { "roomCode": code };
			break;
		default:
			console.error("올바르지 않은 유형입니다.");
			return;
	}
	$.ajax({
		type: "POST",
		url: url,
		data: dataObject,
		success: function(response) {

			console.log("response");
			console.log(response);
			handleSuccess(type);
		},
		error: function(error) {
			handleFailure();
		}
	});
});

function handleSuccess(type) {
	console.log("handle")
	switch (type) {
		case "car":
			toastr.success("차량이 성공적으로 삭제되었습니다.");
			innerBodyAjax('/WareBridge/admin/book/car');
			break;
		case "equip":
			toastr.success("장비가 성공적으로 삭제되었습니다.");
			innerBodyAjax('/WareBridge/admin/book/equip');
			break;
		case "room":
			toastr.success("시설이 성공적으로 삭제되었습니다.");
			innerBodyAjax('/WareBridge/admin/book/room');
			break;
		default:
			console.error("삭제 중 오류가 발생했습니다.");
	}
}
function handleFailure() {
	console.error("삭제 중 오류가 발생했습니다.");
}

$(document).off("submit", "#carModiForm")
$(document).on("submit", "#carModiForm", function(event) {
	event.preventDefault()
	var carData = {
            carCode: $("#carCode").val(),
            carName: $("#carName").val(),
            carDetail: $("#carDetail").val(),
            carAble: $("#carAble").val()
        };
 $.ajax({
        type: "POST",
        url: "/WareBridge/admin/book/car/change/" + carData.carCode,
        data:carData,
        success: function(response) {
            innerBodyAjax('/WareBridge/admin/book/car');
        },
        error: function(error) {
            console.error("시설 수정 중 오류가 발생했습니다.");
        }
    });
});
$(document).off('click',"a.modification")
$(document).on('click',"a.modification",function(event){
	event.preventDefault();
	let code = $(this).data('code');
	url = `${this.href}/${code}`;
	innerBodyAjax(url)
})
$(document).off("submit", "#mdifyForm")
$(document).on("submit", "#mdifyForm", function(event) {
	event.preventDefault()
	var roomData = {
            roomCode: $("#roomCode").val(),
            roomName: $("#roomName").val(),
            roomSite: $("#roomSite").val(),
            roomDetail: $("#roomDetail").val(),
            roomAble: $("#roomAble").val()
        };
 $.ajax({
        type: "POST",
        url: "/WareBridge/admin/book/room/change/" + roomData.roomCode,
        data:roomData,
        success: function(response) {
            innerBodyAjax('/WareBridge/admin/book/room');
        },
        error: function(error) {
            console.error("시설 수정 중 오류가 발생했습니다.");
        }
    });
});
$(document).off("submit", "#eModiForm")
$(document).on("submit", "#eModiForm", function(event) {
	event.preventDefault()
	var equipData = {
            equipCode: $("#equipCode").val(),
            equipName: $("#equipName").val(),
            equipDetail: $("#equipDetail").val(),
            equipAble: $("#equipAble").val()
        };
 $.ajax({
        type: "POST",
        url: "/WareBridge/admin/book/equip/change/" + equipData.equipCdoe,
        data: equipData,
        success: function(response) {
            innerBodyAjax('/WareBridge/admin/book/equip');
        },
        error: function(error) {
            console.error("장비 수정 중 오류가 발생했습니다.");
        }
    });
});

function handleSuccess(type) {
	console.log("handle")
	switch (type) {
		case "car":
			innerBodyAjax('/WareBridge/admin/book/car');
			break;
		case "equip":
			innerBodyAjax('/WareBridge/admin/book/equip');
			break;
		case "room":
			innerBodyAjax('/WareBridge/admin/book/room');
			break;
		default:
			console.error("삭제 중 오류가 발생했습니다.");
	}
}
function handleFailure() {
	console.error("삭제 중 오류가 발생했습니다.");
}

$(document).off('submit', '#bookInsert')
$(document).on('submit', '#bookInsert', function(event) {
	event.preventDefault();
	let bookData = new FormData(event.target);
	$.ajax({
		type: "POST",
		url: `${cPath}/user/book/makeBook`,
		data: bookData,
		processData: false,
        contentType: false, 
		success: function(response) {
			$('#smallModal').modal('hide');
			toastr.success("예약이 완료되었습니다.");
			//innerBodyAjax(`${cPath}response.location`)
			location.reload();
		},
	});
	
});