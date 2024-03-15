<%-- 
    Document   : updateaccountbyadmin
    Created on : Mar 10, 2024, 3:06:44 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Apply for a Job</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            body {
                background-color: #2779e2;
            }
            .section {
                background-color: #ffffff;
                border-radius: 15px;
                border: 2px solid #007bff;
            }
            .card {
                border-radius: 15px;
                border: 1px solid #007bff;
            }
            .card-body {
                background-color: #ffffff;
            }
        </style>
    </head>
    <body>

        <section class="vh-100">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-9">
                        <h1 class="text-white mb-4">Apply for a job</h1>
                        <div class="section">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row align-items-center pt-4 pb-3">
                                        <div class="col-md-3 ps-5">
                                            <h6 class="mb-0">Full name</h6>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <input type="text" class="form-control form-control-lg" />
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">
                                            <h6 class="mb-0">Email address</h6>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <input type="email" class="form-control form-control-lg" placeholder="example@example.com" />
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">
                                            <h6 class="mb-0">Message</h6>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <textarea class="form-control" rows="3" placeholder="Message sent to the employer"></textarea>
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">
                                            <h6 class="mb-0">Upload CV</h6>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <input class="form-control form-control-lg" id="formFileLg" type="file" />
                                            <div class="small text-muted mt-2">Upload your CV/Resume or any other relevant file. Max file
                                                size 50 MB</div>
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="px-5 py-4">
                                        <button type="submit" class="btn btn-primary btn-lg">Send application</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
