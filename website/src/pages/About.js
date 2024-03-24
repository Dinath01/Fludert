import React from "react";
import Nav from "../components/Nav.js";
import "../components/style/about.css";
import ravindu from "../Images/ravindu.jpg";
import dinath1 from "../Images/dinath.jpg";
import Trevin from "../Images/trevin.jpg";
import kasun from "../Images/kasun.jpg";
import tharani from "../Images/tharani.jpg";
import shaleen from "../Images/shaleen.jpg";

export default function About() {
  return (
    <div>
      <Nav />
      <section>
        <div class="box">
          <div class="students_details">
            <div class="arrow-left">
              <i class="ri-arrow-left-circle-fill" id="left-arrow"></i>
            </div>
            <div class="arrow-right">
              <i class="ri-arrow-right-circle-fill" id="right-arrow"></i>
            </div>
            <div class="student-details-content" id="student-details">
              <div className="card">
                <div class="card-top">
                  <div class="card-image">
                    <img src={dinath1} alt="" />
                  </div>
                </div>
                <div class="card-bottom">
                  <div class="card-bottom-content">
                    <h3>Dinith Nethmina</h3>
                    <p>Software Engineering</p>
                    <p>IIT ID - 20222189</p>
                    <p>UoW ID - w1985739</p>
                  </div>
                </div>

                <div class="left-page-down"></div>
                <div class="right-page-down"></div>
              </div>

              <div className="card">
                <div class="card-top">
                  <div class="card-image">
                    <img src={ravindu} alt="" />
                  </div>
                </div>
                <div class="card-bottom">
                  <div class="card-bottom-content">
                    <h3>Ravindu Dahanayake</h3>
                    <p>Software Engineering</p>
                    <p>IIT ID - 20222300</p>
                    <p>UoW ID - w1989369</p>
                  </div>
                </div>

                <div class="left-page-down"></div>
                <div class="right-page-down"></div>
              </div>

              <div className="card">
                <div class="card-top">
                  <div class="card-image">
                    <img src={Trevin} alt="" />
                  </div>
                </div>
                <div class="card-bottom">
                  <div class="card-bottom-content">
                    <h3>Trevin Joseph</h3>
                    <p>Software Engineering</p>
                    <p>IIT ID - 20220612</p>
                    <p>UoW ID - w1953285</p>
                  </div>
                </div>

                <div class="left-page-down"></div>
                <div class="right-page-down"></div>
              </div>

              <div className="card">
                <div class="card-top">
                  <div class="card-image">
                    <img src={shaleen} alt="" />
                  </div>
                </div>
                <div class="card-bottom">
                  <div class="card-bottom-content">
                    <h3>Shaleen Perera</h3>
                    <p>Software Engineering</p>
                    <p>IIT ID - 20221330</p>
                    <p>UoW ID - w1956106</p>
                  </div>
                </div>

                <div class="left-page-down"></div>
                <div class="right-page-down"></div>
              </div>

              <div className="card">
                <div class="card-top">
                  <div class="card-image">
                    <img src={kasun} alt="" />
                  </div>
                </div>
                <div class="card-bottom">
                  <div class="card-bottom-content">
                    <h3>Kasun Prathapasinghe</h3>
                    <p>Software Engineering</p>
                    <p>IIT ID - 20200859</p>
                    <p>UoW ID - w1836101</p>
                  </div>
                </div>

                <div class="left-page-down"></div>
                <div class="right-page-down"></div>
              </div>

              <div className="card">
                <div class="card-top">
                  <div class="card-image">
                    <img src={tharani} alt="" />
                  </div>
                </div>
                <div class="card-bottom">
                  <div class="card-bottom-content">
                    <h3>Tharani Udugampola</h3>
                    <p>Software Engineering</p>
                    <p>IIT ID - 20220295</p>
                    <p>UoW ID - w2001275</p>
                  </div>
                </div>

                <div class="left-page-down"></div>
                <div class="right-page-down"></div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
