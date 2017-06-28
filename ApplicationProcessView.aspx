<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ApplicationProcessView.aspx.vb"
    MasterPageFile="~/MasterPage.master" Inherits="ApplicationProcessView" Title="Application Process"
    Theme="CommonSkin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="Sources/js/modernizr.custom.29473.js" type="text/javascript"></script>

    <link href="Sources/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .protected
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
    </style>

    <script language="javascript" type="text/javascript">
    
     function onKeyDown() {

    // current pressed key
     var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();

        if (event.ctrlKey && (pressedKey == "c" || 
                        pressedKey == "v")) {
        // <strong class="highlight">disable</strong> key press porcessing
        event.returnValue = false;
         }

        } // onKeyDown
        
    function DisableCopyPaste()
    {
        alert('This functionality has been disabled !');   
        window.clipboardData.clearData('Text'); //for cleaning up the clipboard
        // Cancel default behavior
        event.returnValue = false;
    }

    </script>

    <script language="javascript" type="text/javascript">
        window.history.forward(1);
        
        document.oncontextmenu = function () { // Use document as opposed to window for IE8 compatibility
           alert("This Function Is Not Allowed In ULC JOB Application Process.")
           return false;
        };
    </script>

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);



            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

    <table width="100%" class="protected">
        <tr>
            <td>
                <div class="container">
                    <header>
				        <h1>Application Process <span>In United Leasing Company</span></h1>
			        </header>
                    <section class="ac-container">
				        <div>
					        <input id="ac-1" name="accordion-1" type="radio" checked />
					        <label for="ac-1"> &#x2776; CREATE USER ID FOR JOB APPLICATION</label>
					        <article class="ac-small">
						        <p>You need to open a new user ID to login here. After login, you will have to create/modify your profile to submit for job application. You are requested to provide correct data; otherwise your application may be dismissed at any time during the recruitment process.</p>
					        </article>
				        </div>
				        <div>
					        <input id="ac-2" name="accordion-1" type="radio" />
					        <label for="ac-2"> &#x2777; SUBMIT PROFILE FOR JOB APPLICATION</label>
					        <article class="ac-medium">
						        <p>You need to submit your profile for the job application. You can submit your profile at any time even when there is no available job circular of the Company.</p>
					        </article>
				        </div>
				        <div>
					        <input id="ac-3" name="accordion-1" type="radio" />
					        <label for="ac-3"> &#x2778; APPLICATION REVIEW</label>
					        <article class="ac-large">
						        <p>During this stage, all applications will be reviewed by the HR department and screened applicants will be communicated through mail and/or mobile.</p>
					        </article>
				        </div>
				        <div>
					        <input id="ac-4" name="accordion-1" type="radio" />
					        <label for="ac-4"> &#x2779; EXAM AND INTERVIEW PROCESS</label>
					        <article class="ac-large">
						        <p>Applicants will be communicated to sit for written and/or practical exam at ULC’s premises. Upon attending the exam, successful applicants will be requested to attend for interview with the interview panel.</p>
					        </article>
				        </div>
				        <div>
					        <input id="ac-5" name="accordion-1" type="radio" />
					        <label for="ac-5"> &#x277A; FINAL SELECTION</label>
					        <article class="ac-large">
						        <p>Upon attending interview, applicants will be selected by the interview panel. Selected applicants will be notified to communicate with the HR.</p>
					        </article>
				        </div>
			        </section>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
