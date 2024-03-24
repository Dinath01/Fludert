import React from "react";
import Nav from "../components/Nav.js";
import Footer from "../components/Footer.js";
import "../components/style/Home.css";
import Welcome from "../Images/welcome.jpg";
import Alert from "../Images/alert.jpg";
import Evacuation from "../Images/evacuation.jpg";
import Colab from "../Images/colab.jpg";
import Track from "../Images/track.jpg";
import Trevin from "../Images/trevin.jpg";

export default function Home() {
  return (
    <div>
      <Nav />
      <div>
        <section>
          <div className="section-content-1">
            <div className="box">
              <div className="section-content-1-content-1">
                <div className="section-content-1-content-1-header">
                  <h1>Welcome To Fludert</h1>
                </div>
                <div className="section-content-1-content-1-para">
                  <p>A mobile application for efficient flood management</p>
                </div>
              </div>
              <div className="section-content-1-content-2">
                <img
                  src={Welcome}
                  alt=""
                  style={{ height: "450px", width: "100%" }}
                />
              </div>
            </div>
          </div>
          <hr />
          <div className="section-content-2">
            <div className="box">
              <div className="section-content-2-content">
                <div className="section-content-2-content-1">
                  <div className="section-content-2-content-1-header">
                    <h1>Features</h1>
                  </div>
                  <div className="section-content-2-content-1-para">
                    <p>Explore the capabilities of Fludert</p>
                  </div>
                </div>
                <div className="section-content-2-content-2">
                  <div className="section-content-2-content-2-cards">
                    <div className="section-content-2-content-2-card-1">
                      <div className="section-content-2-Image">
                        <img
                          src={Alert}
                          alt=""
                          style={{
                            height: "100%",
                            width: "100%",
                            borderTopLeftRadius: "10px",
                            borderTopRightRadius: "10px",
                          }}
                        />
                      </div>
                      <div className="section-content-2-description">
                        <div className="section-content-2-description-para">
                          <p>Real time Flood Notifications</p>
                        </div>

                        <h3>Get Instance Alerts from Floods</h3>
                      </div>
                    </div>
                    <div className="section-content-2-content-2-card-2">
                      <div className="section-content-2-Image">
                        <img
                          src={Evacuation}
                          alt=""
                          style={{
                            height: "100%",
                            width: "100%",
                            borderTopLeftRadius: "10px",
                            borderTopRightRadius: "10px",
                          }}
                        />
                      </div>
                      <div className="section-content-2-description">
                        <div className="section-content-2-description-para">
                          <p>Evacuation Routes</p>
                        </div>

                        <h3>Plan safe routes for evacuation</h3>
                      </div>
                    </div>
                    <div className="section-content-2-content-2-card-3">
                      <div className="section-content-2-Image">
                        <img
                          src={Track}
                          alt=""
                          style={{
                            height: "100%",
                            width: "100%",
                            borderTopLeftRadius: "10px",
                            borderTopRightRadius: "10px",
                          }}
                        />
                      </div>
                      <div className="section-content-2-description">
                        <div className="section-content-2-description-para">
                          <p>Flood monitoring</p>
                        </div>

                        <h3>Track flood levels </h3>
                      </div>
                    </div>
                    <div className="section-content-2-content-2-card-4">
                      <div className="section-content-2-Image">
                        <img
                          src={Colab}
                          alt=""
                          style={{
                            height: "100%",
                            width: "100%",
                            borderTopLeftRadius: "10px",
                            borderTopRightRadius: "10px",
                          }}
                        />
                      </div>
                      <div className="section-content-2-description">
                        <div className="section-content-2-description-para">
                          <p>Collobaraters</p>
                        </div>

                        <h3>Reach out our Collobaraters</h3>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr />
          <div className="section-content-3">
            <div className="box">
              <div className="section-content-3-content">
                <div className="section-content-3-content-1">
                  <div className="section-content-3-content-1-header">
                    <h1>How Fludert Works</h1>
                  </div>
                  <div className="section-content-3-content-1-paragraph">
                    <p>Learn about the comprehensive flood management system</p>
                  </div>
                </div>
                <div className="section-content-3-content-2">
                  <div className="section-content-3-content-2-content-1">
                    <div className="box-1">
                      <img
                        src={Alert}
                        alt=""
                        style={{
                          height: "100%",
                          width: "100%",
                        }}
                      />
                    </div>
                    <div className="box-2">
                      <h3>Real Time Data Analysis</h3>
                      <p style={{ fontSize: "15px" }}>
                        Fludert Consuntantly Processes data to provide
                        up-to-data insights on flood Situations
                      </p>
                      <p style={{ marginTop: "27px", fontSize: "12px" }}>
                        Data Analysis
                      </p>
                    </div>
                  </div>
                  <div className="section-content-3-content-2-content-2">
                    <div className="box-1">
                      <img
                        src={Track}
                        alt=""
                        style={{
                          height: "100%",
                          width: "100%",
                        }}
                      />
                    </div>
                    <div className="box-2">
                      <h3>Intelligent Alerts</h3>
                      <p style={{ fontSize: "15px" }}>
                        Receive instant notifications and warnings for potential
                        flood risks
                      </p>
                      <p style={{ marginTop: "45px", fontSize: "12px" }}>
                        Alerts Notifications
                      </p>
                    </div>
                  </div>
                  <div className="section-content-3-content-2-content-3">
                    <div className="box-1">
                      <img
                        src={Colab}
                        alt=""
                        style={{
                          height: "100%",
                          width: "100%",
                        }}
                      />
                    </div>
                    <div className="box-2">
                      <h3>Plan Evacuation Routes</h3>
                      <p style={{ fontSize: "15px" }}>
                        Plan efficient and safe routes for evacuation during
                        flood emergencies
                      </p>
                      <p style={{ marginTop: "47px", fontSize: "12px" }}>
                        Evacuation Routes
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr />
          <div className="section-content-4">
            <div className="section-content-4-content-1">
              <div className="box">
                <div className="section-content-4-content-1-content">
                  <div className="section-content-4-content-1-content-1">
                    <h3>User Reviews</h3>
                  </div>
                  <div className="section-content-4-content-1-content-2">
                    <div className="section-content-4-content-1-content-2-content-1">
                      <div className="review">
                        <div className="section-content-4-content-1-content-2-content-1-box-1">
                          <img
                            src={Trevin}
                            alt=""
                            style={{
                              height: "100%",
                              width: "100%",
                              borderRadius: "50%",
                            }}
                          />
                        </div>

                        <h5>John Doe</h5>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                      </div>
                      <div className="review-details">
                        <p>
                          Fludert has been a game changer in managing floods.
                          Highly recommended!
                        </p>
                      </div>
                    </div>
                    <div className="section-content-4-content-1-content-2-content-2">
                      <div className="review">
                        <div className="section-content-4-content-1-content-2-content-1-box-1">
                          <img
                            src={Trevin}
                            alt=""
                            style={{
                              height: "100%",
                              width: "100%",
                              borderRadius: "50%",
                            }}
                          />
                        </div>

                        <h5>Jane Smith</h5>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                        <i class="ri-star-s-fill"></i>
                      </div>
                      <div className="review-details">
                        <p>
                          The accuracy of flood information provided by Fludert
                          is commendable.
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="section-content-4-content-2">
              <div className="box">
                <div className="section-content-4-content-2-content-1">
                  <h1>Flood Metrics</h1>
                  <p>Key data insights on flood management</p>
                </div>
              </div>
              <div className="box">
                <div className="section-content-4-content-2-content-2">
                  <div className="section-content-4-content-2-content-2-content-1">
                    <div className="square">
                      <p>Flood Incidents</p>
                      <h1 style={{ marginTop: "10px" }}>152</h1>
                      <p style={{ marginTop: "10px" }}>
                        +10% compared to last month
                      </p>
                    </div>
                  </div>
                  <div className="section-content-4-content-2-content-2-content-2">
                    <div className="square">
                      <p>Evacuations</p>
                      <h1 style={{ marginTop: "10px" }}>67</h1>
                      <p style={{ marginTop: "10px" }}>
                        -5% compared to last month
                      </p>
                    </div>
                  </div>
                  <div className="section-content-4-content-2-content-2-content-3">
                    <div className="square">
                      <p>Alerts Sent</p>
                      <h1 style={{ marginTop: "10px" }}>768</h1>
                      <p style={{ marginTop: "10px" }}>
                        +15% compared to last month
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <Footer></Footer>
    </div>
  );
}
