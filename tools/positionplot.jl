using Plots

function position_graph(x_data, y_data, z_data, frames, zone_number)
    anim = @animate for i = 1:frames
        scatter3d(
            x_data[((i-1)*zone_number+1):((i)*zone_number)],
            y_data[((i-1)*zone_number+1):((i)*zone_number)],
            z_data[((i-1)*zone_number+1):((i)*zone_number)],
            xlim = (-0.1, 1.1),
            ylim = (-0.1, 1.1),
            zlim = (-0.1, 1.1),
            title = "Positions",
            legend = false,
            marker = 2,
        )
    end

    return gif(anim, "tmp.gif", fps = 15)
end

macro plot(zone_number, frames)
    return position_graph(x_store, y_store, z_store, frames, zone_number)
end
