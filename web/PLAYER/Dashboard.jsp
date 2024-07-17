<%-- 
    Document   : Training
    Created on : Jun 1, 2024, 7:41:32 AM
    Author     : Zanis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    </head>
    <body>
        <div>
            <%@include file="../PLAYER/siderbar.jsp" %>
        </div>  
        <div class="coach-fun-content" style="padding: 20px; background-color: white; box-shadow: 0 0 15px 15px lightblue;">
            <div style="width: 100%; height: 100px"></div>
            <h1 style="text-align: center; color: black;">Dashboard</h1>

            <div class="row">
                <div class="col-md-12" style="padding: 0">
                    <div>
                        <canvas id="combinedChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // Plugin to change bar width
            const customBarWidthPlugin = {
                id: 'customBarWidth',
                beforeDatasetsDraw(chart, args, options) {
                    const ctx = chart.ctx;
                    chart.data.datasets.forEach((dataset, datasetIndex) => {
                        const meta = chart.getDatasetMeta(datasetIndex);
                        meta.data.forEach((bar, index) => {
                            // Increase width for specific bars
                            if (index < 4) {
                                bar.width = options.totalBarWidth || 60; // Total columns
                            } else {
                                bar.width = options.defaultBarWidth || 30; // Monthly data columns
                            }
                        });
                    });
                }
            };

            Chart.register(customBarWidthPlugin);

            const combinedCtx = document.getElementById('combinedChart').getContext('2d');
            new Chart(combinedCtx, {
                type: 'bar',
                data: {
                    labels: [
                        'Total Red Cards', 'Total Yellow Cards', 'Total Goals', 'Total Assists', 
                        'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
                    ],
                    datasets: [
                        {
                            label: 'Player Statistics',
                            data: [${a.totalRed}, ${a.totalYellow}, ${a.totalGoals}, ${a.totalAssists}, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 205, 86)',
                                'rgb(201, 203, 207)',
                                'rgb(54, 162, 235)',
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)', // Transparent for months
                                'rgba(0, 0, 0, 0)'  // Transparent for months
                            ]
                        },
                        {
                            label: 'Monthly Treatment Data',
                            data: [0, 0, 0, 0, ${nm.get(0)}, ${nm.get(1)}, ${nm.get(2)}, ${nm.get(3)}, ${nm.get(4)}, ${nm.get(5)}, ${nm.get(6)}, ${nm.get(7)}, ${nm.get(8)}, ${nm.get(9)}, ${nm.get(10)}, ${nm.get(11)}],
                            backgroundColor: 'rgb(75, 192, 192)'
                        },
                        {
                            label: 'Monthly Meeting Data',
                            data: [0, 0, 0, 0, ${n.get(0)}, ${n.get(1)}, ${n.get(2)}, ${n.get(3)}, ${n.get(4)}, ${n.get(5)}, ${n.get(6)}, ${n.get(7)}, ${n.get(8)}, ${n.get(9)}, ${n.get(10)}, ${n.get(11)}],
                            backgroundColor: 'rgb(153, 102, 255)'
                        }
                    ]
                },
                options: {
                    plugins: {
                        customBarWidth: {
                            totalBarWidth: 40, // Width for total columns
                            defaultBarWidth: 20  // Default width for other columns
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>
    