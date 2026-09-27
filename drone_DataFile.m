% Simscape(TM) Multibody(TM) version: 24.1

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(9).translation = [0.0 0.0 0.0];
smiData.RigidTransform(9).angle = 0.0;
smiData.RigidTransform(9).axis = [0.0 0.0 0.0];
smiData.RigidTransform(9).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [850.55748950198677 218.19890431201415 847.14586341776044];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931757;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918961907 -0.57735026918963106 -0.57735026918962717];
smiData.RigidTransform(1).ID = "B[base1-1:-:fan-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-6.0344963458192069e-05 81.007318042645807 -9.7653637567418627e-06];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931753;  % rad
smiData.RigidTransform(2).axis = [-0.57735026918961918 -0.57735026918963117 -0.57735026918962706];
smiData.RigidTransform(2).ID = "F[base1-1:-:fan-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [-846.49878534572235 218.19890431200818 847.14586341787947];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(3).ID = "B[base1-1:-:fan-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-6.0344957205415994e-05 81.007318042639724 -9.7653668262864812e-06];  % mm
smiData.RigidTransform(4).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(4).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(4).ID = "F[base1-1:-:fan-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-846.49878534584627 218.19890431203814 -849.91041142981862];  % mm
smiData.RigidTransform(5).angle = 2.0943951023931913;  % rad
smiData.RigidTransform(5).axis = [-0.57735026918962451 -0.57735026918961641 -0.57735026918963639];
smiData.RigidTransform(5).ID = "B[base1-1:-:fan-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-6.0344953567437187e-05 81.007318042669681 -9.7653550028553582e-06];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931913;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918962451 -0.57735026918961652 -0.57735026918963628];
smiData.RigidTransform(6).ID = "F[base1-1:-:fan-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [850.55748950186285 218.19890431204414 -849.91041142994868];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931713;  % rad
smiData.RigidTransform(7).axis = [-0.57735026918961774 -0.57735026918962173 -0.57735026918963783];
smiData.RigidTransform(7).ID = "B[base1-1:-:fan-4]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-6.0344966072989337e-05 81.007318042675934 -9.7653569355315994e-06];  % mm
smiData.RigidTransform(8).angle = 2.0943951023931713;  % rad
smiData.RigidTransform(8).axis = [-0.57735026918961774 -0.57735026918962173 -0.57735026918963783];
smiData.RigidTransform(8).ID = "F[base1-1:-:fan-4]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 228.80109568799156 0];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = "SixDofRigidTransform[base1-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(2).mass = 0.0;
smiData.Solid(2).CoM = [0.0 0.0 0.0];
smiData.Solid(2).MoI = [0.0 0.0 0.0];
smiData.Solid(2).PoI = [0.0 0.0 0.0];
smiData.Solid(2).color = [0.0 0.0 0.0];
smiData.Solid(2).opacity = 0.0;
smiData.Solid(2).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 121.7585023821259;  % kg
smiData.Solid(1).CoM = [1.7017373826729163 20.262183793952328 -1.893647996780256];  % mm
smiData.Solid(1).MoI = [27392845.542657211 51537025.28355971 28724741.122267];  % kg*mm^2
smiData.Solid(1).PoI = [-2071.8166065797436 -205.4527417002941 -2952.8680321965012];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "base1*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 1.0373598271538311;  % kg
smiData.Solid(2).CoM = [8.2645176942590119e-06 -0.11192629890799445 3.5020046941647404e-07];  % mm
smiData.Solid(2).MoI = [77898.425035970824 79419.144985834864 1915.4570309703722];  % kg*mm^2
smiData.Solid(2).PoI = [0.0054639077277002721 -2951.807574652194 -0.0038019461977569649];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "fan*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(4).Rz.Pos = 0.0;
smiData.RevoluteJoint(4).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 1.1017764609091714e-14;  % deg
smiData.RevoluteJoint(1).ID = "[base1-1:-:fan-1]";

smiData.RevoluteJoint(2).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(2).ID = "[base1-1:-:fan-2]";

smiData.RevoluteJoint(3).Rz.Pos = 1.7991934265579777e-14;  % deg
smiData.RevoluteJoint(3).ID = "[base1-1:-:fan-3]";

smiData.RevoluteJoint(4).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(4).ID = "[base1-1:-:fan-4]";

