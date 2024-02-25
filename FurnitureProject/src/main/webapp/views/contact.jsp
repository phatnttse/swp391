<%-- 
    Document   : contact
    Created on : Feb 22, 2024, 8:51:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/contact.css">
        <link rel="icon" href="favicon.ico" type="image/x-icon">    
        <title>Liên Hệ</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/breadcrumb.jsp"%>

    <section class="layout-contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div id="contact_map" class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6099415305034!2d106.80730807524796!3d10.841132857996417!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1708315161496!5m2!1sen!2s"  width="600" height="450" style="border:0; max-width: 100%" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="contact">
                        <h4>Cửa hàng nội thất 3PTN Furniture</h4>
                        <div class="time_work">
                            <div class="item">
                                <svg aria-hidden="true" focusable="false" data-prefix="fas"
                                    data-icon="map-marker-alt" role="img" xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 384 512" class="svg-inline--fa fa-map-marker-alt fa-w-12 custom-icon"><path
                                        fill="currentColor"
                                        d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"
                                        class=""></path></svg>
                                <b>Địa chỉ:</b>
                                FPT University HCMC
                                Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 
                            </div>
                            <div class="item">
                                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="envelope"
                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                    class="svg-inline--fa fa-envelope fa-w-16 custom-icon"><path fill="currentColor"
                                        d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z"
                                        class=""></path></svg>
                                <b>Email:</b> <a href="mailto:3ptn@gmail.com" title="3ptn@gmail.com">3ptn@gmail.com</a>
                            </div>
                            <div class="item">
                                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="phone-alt"
                                    role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                    class="svg-inline--fa fa-phone-alt fa-w-16 custom-icon"><path fill="currentColor"
                                        d="M497.39 361.8l-112-48a24 24 0 0 0-28 6.9l-49.6 60.6A370.66 370.66 0 0 1 130.6 204.11l60.6-49.6a23.94 23.94 0 0 0 6.9-28l-48-112A24.16 24.16 0 0 0 122.6.61l-104 24A24 24 0 0 0 0 48c0 256.5 207.9 464 464 464a24 24 0 0 0 23.4-18.6l24-104a24.29 24.29 0 0 0-14.01-27.6z"
                                        class=""></path></svg>
                                <b>Hotline:</b> <a class="fone" href="tel:0123456789" title="19006750">0123456789</a>
                            </div>
                        </div>
                    </div>
                    <div class="form-contact">
                        <h4>Liên hệ với chúng tôi</h4>
                        <span class="content-form">
                            Nếu bạn có thắc mắc gì, có thể gửi yêu cầu cho chúng tôi, và chúng tôi sẽ liên lạc lại
                            với bạn sớm nhất có thể.
                        </span>
                        <div id="pagelogin">
                            <!-- Form liên hệ -->
                            <form method="post" action="/postcontact" id="contact" accept-charset="UTF-8">                                                          
                                <div class="group_contact">
                                    <input placeholder="Họ và tên" type="text"
                                        class="form-control  form-control-lg" required="" value=""
                                        name="contact[Name]">
                                    <input placeholder="Email" type="email"
                                        pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required="" id="email1"
                                        class="form-control form-control-lg"
                                        value="" name="contact[email]">
                                    <input type="number" placeholder="Điện thoại*" name="contact[phone]"
                                        class="form-control form-control-lg" required="">
                                    <textarea placeholder="Nội dung" name="contact[body]" id="comment"
                                        class="form-control content-area form-control-lg" rows="5"
                                        required=""></textarea>
                                    <button type="submit" class="btn-lienhe">Gửi thông tin</button>
                                </div>
                            </form>
                            <!-- Kết thúc form liên hệ -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>
</html>
