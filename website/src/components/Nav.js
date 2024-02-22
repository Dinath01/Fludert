import React from "react";
import Image from "../Images/logo.jpg";
import "./style/nav.css";
import { Link } from "react-router-dom";
import 'remixicon/fonts/remixicon.css'

export default function Nav() {
  return (
    <div>
      <nav>
        <div className="box">
          <div className="nav-content">
            <div className="nav-content-1">
              <img
                src={Image}
                alt=""
                style={{ width: "150px", height: "60px" }}
              />
            </div>
            <div className="nav-content-2">
              <ul>
                <li>
                  <Link to="/">Home</Link>
                </li>
                <li>
                  <Link to="/about">About Us</Link>
                </li>
              </ul>
            </div>
            <div className="nav-content-3">
              <i class="ri-menu-line"></i>
            </div>
          </div>
        </div>
      </nav>
    </div>
  );
}
