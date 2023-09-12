  <!--   navbar -->
  <nav class="navbar navbar-dark bg-dark" aria-label="Dark offcanvas navbar">
    <div class="container-fluid">
      <button class="navbar-toggler me-auto" type="button" data-bs-toggle="offcanvas"
        data-bs-target="#offcanvasNavbarDark" aria-controls="offcanvasNavbarDark">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="ms-auto d-flex">
        <a class="nav-link mx-3" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="white" class="bi bi-bell-fill"
            viewBox="0 0 16 16">
            <path
              d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z" />
          </svg>
        </a>
        <a class="nav-link mx-3" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-person-fill"
            viewBox="0 0 16 16">
            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
          </svg>
        </a>

      </div>

      <!--       offcanvas menu -->
      <div class="offcanvas offcanvas-start text-bg-dark" tabindex="-1" id="offcanvasNavbarDark"
        aria-labelledby="offcanvasNavbarDarkLabel">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasNavbarDarkLabel">ERP</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
            aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            <li class="nav-item">
              <a class="nav-link"  href="dashboard.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="acad-menu.jsp">Academics</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Activity</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Miscellaneous</a>
            </li>

          </ul>

        </div>
      </div>
    </div>
  </nav>