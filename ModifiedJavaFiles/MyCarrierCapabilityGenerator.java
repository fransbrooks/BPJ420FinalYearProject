package playground.qvanheerden.freight;

import org.matsim.api.core.v01.Coord;
import org.matsim.api.core.v01.Id;
import org.matsim.api.core.v01.Scenario;
import org.matsim.api.core.v01.network.Network;
import org.matsim.contrib.freight.carrier.Carrier;
import org.matsim.contrib.freight.carrier.CarrierCapabilities;
import org.matsim.contrib.freight.carrier.CarrierImpl;
import org.matsim.contrib.freight.carrier.CarrierPlanXmlWriterV2;
import org.matsim.contrib.freight.carrier.CarrierVehicle;
import org.matsim.contrib.freight.carrier.CarrierVehicleType;
import org.matsim.contrib.freight.carrier.CarrierVehicleTypeWriter;
import org.matsim.contrib.freight.carrier.CarrierVehicleTypes;
import org.matsim.contrib.freight.carrier.Carriers;
import org.matsim.core.basic.v01.IdImpl;
import org.matsim.core.config.Config;
import org.matsim.core.config.ConfigUtils;
import org.matsim.core.network.NetworkImpl;
import org.matsim.core.scenario.ScenarioUtils;
import org.matsim.core.utils.geometry.CoordImpl;

import playground.southafrica.utilities.Header;

public class MyCarrierCapabilityGenerator {

	public static void main(String[] args) {
		Header.printHeader(MyCarrierCapabilityGenerator.class.toString(), args);
		String networkFile = args[0];
		Double depotLong = Double.parseDouble(args[1]);
		Double depotLat = Double.parseDouble(args[2]);
		Coord depotCoord = new CoordImpl(depotLong, depotLat);

		String outputDir = args[3];

		Config config = ConfigUtils.createConfig();
		config.controler().setOutputDirectory("./output/freight/");
		config.network().setInputFile(networkFile);
		config.network().setTimeVariantNetwork(true);
		Scenario scenario = ScenarioUtils.loadScenario(config);
		Id depotLink = ((NetworkImpl) scenario.getNetwork()).getNearestLink((Coord) depotCoord).getId();

		MyCarrierCapabilityGenerator mccg = new MyCarrierCapabilityGenerator();
		CarrierVehicleTypes carrierVehicleTypesTotal = mccg.buildAndWriteVehicleTypes(outputDir + "/vehicleTypes_total.xml", true);
		CarrierVehicleTypes carrierVehicleTypesVar = mccg.buildAndWriteVehicleTypes(outputDir + "/vehicleTypes_var.xml", false);

		CarrierCapabilities carrierCapabilitiesTotal = mccg.createVehicles(carrierVehicleTypesTotal, depotLink);
		CarrierCapabilities carrierCapabilitiesVar = mccg.createVehicles(carrierVehicleTypesVar, depotLink);

		Carrier carrierTotal = CarrierImpl.newInstance(new IdImpl("MyCarrier"));
		carrierTotal.setCarrierCapabilities(carrierCapabilitiesTotal);

		Carriers carriersTotal = new Carriers();
		carriersTotal.addCarrier(carrierTotal);
		CarrierPlanXmlWriterV2 planWriter = new CarrierPlanXmlWriterV2(carriersTotal);
		planWriter.write(outputDir + "/carrier_total.xml");

		Carrier carrierVar = CarrierImpl.newInstance(new IdImpl("MyCarrier"));
		carrierVar.setCarrierCapabilities(carrierCapabilitiesVar);

		Carriers carriersVar = new Carriers();
		carriersVar.addCarrier(carrierVar);
		planWriter = new CarrierPlanXmlWriterV2(carriersVar);
		planWriter.write(outputDir + "/carrier_var.xml");

		Header.printFooter();
	}

	/**
	 * This method will generate vehicles (also known as {@link CarrierCapabilities}).
	 * <br><br>
	 * 10 vehicles are created:
	 * <ul>
	 * <li> 1 x 3 tonners
	 * <li> 4 x 6 tonners
	 * <li> 2 x 7 tonners
	 * <li> 1 x 12 tonners
	 * <li> 2 x 15 tonners
	 * </ul>
	 * 
	 */
	public CarrierCapabilities createVehicles(CarrierVehicleTypes carrierVehicleTypes, Id depotLink){
		double earliestStart = 21600; //6am
		double latestEnd = 75600; //9pm
		//		double earliestStart = 0; //0
		//		double latestEnd = 172800; //48
		//		
		CarrierVehicle.Builder builder = CarrierVehicle.Builder.newInstance(new IdImpl("truck_3_1"), depotLink) ;
		builder.setTypeId(new IdImpl("3_tonner")) ;
		builder.setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("3_tonner")));
		builder.setEarliestStart(earliestStart);
		builder.setLatestEnd(latestEnd);
		CarrierVehicle truck_3_1 = builder.build();

		CarrierCapabilities capabilities = CarrierCapabilities.Builder.
				newInstance().
				addType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("3_tonner"))).
				addVehicle(truck_3_1).build();
		
		CarrierVehicle truck_6_1 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_6_1"), depotLink).
				setTypeId(new IdImpl("6_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();

		capabilities.getCarrierVehicles().add(truck_6_1);
		capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner")));

		/*CarrierVehicle truck_6_2 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_6_2"), depotLink).
				setTypeId(new IdImpl("6_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();

		capabilities.getCarrierVehicles().add(truck_6_2);
		//capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner")));

		CarrierVehicle truck_6_3 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_6_3"), depotLink).
				setTypeId(new IdImpl("6_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();

		capabilities.getCarrierVehicles().add(truck_6_3);
		//capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner")));

		CarrierVehicle truck_6_4 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_6_4"), depotLink).
				setTypeId(new IdImpl("6_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();
		capabilities.getCarrierVehicles().add(truck_6_4);
		//capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("6_tonner")));
*/
				CarrierVehicle truck_7_1 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_7_1"), depotLink).
				setTypeId(new IdImpl("7_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("7_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();
		capabilities.getCarrierVehicles().add(truck_7_1);
		capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("7_tonner")));

/*		CarrierVehicle truck_7_2 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_7_2"), depotLink).
				setTypeId(new IdImpl("7_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("7_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();
		capabilities.getCarrierVehicles().add(truck_7_2);
*/
				//capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("7_tonner")));

		CarrierVehicle truck_12_1 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_12_1"), depotLink).
				setTypeId(new IdImpl("12_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("12_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();
		capabilities.getCarrierVehicles().add(truck_12_1);
		capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("12_tonner")));

				CarrierVehicle truck_15_1 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_15_1"), depotLink).
				setTypeId(new IdImpl("15_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("15_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();
		capabilities.getCarrierVehicles().add(truck_15_1);
		capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("15_tonner")));

/*		CarrierVehicle truck_15_2 = CarrierVehicle.Builder.newInstance(new IdImpl("truck_15_2"), depotLink).
				setTypeId(new IdImpl("15_tonner")).
				setType(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("15_tonner"))).
				setEarliestStart(earliestStart).
				setLatestEnd(latestEnd).
				build();
		capabilities.getCarrierVehicles().add(truck_15_2);
*/	
				//capabilities.getVehicleTypes().add(carrierVehicleTypes.getVehicleTypes().get(new IdImpl("15_tonner")));

		return capabilities;
	}

	/**
	 * This method builds vehicle types and writes a file containing the vehicle
	 *  types.  Five vehicle types are created with costs relating to the 
	 *  vehicle cost schedule of the RFA.
	 */
	public CarrierVehicleTypes buildAndWriteVehicleTypes(String vehicleTypeFile, boolean totalCost){
		/* Build vehicle types */
		double factor = 0.1;

		double[] fixCostPerKm;
		if(totalCost){
			fixCostPerKm = new double[]{4.1998*factor, 5.1704*factor, 6.5067*factor, 7.4026*factor, 8.2904*factor}; //in R/km
		}else{
			fixCostPerKm = new double[]{0,0,0,0,0};
		}
		double[] varCostPerKm = {7.7637*factor, 9.1092*factor, 9.6589*factor, 7.3485*factor, 7.2059*factor}; //in R/km * 100/1000 = c/m
		//		double[] varCostPerKm = {776.37, 910.92, 965.89, 734.85, 720.59}; //in c/km
		//		double[] fixCostPerKm = {419.98, 517.04, 650.67, 740.26, 829.04}; //in c/km
		//		double[] varCostPerKm = {0,0,0,0,0};

		CarrierVehicleType typeThree = CarrierVehicleType.Builder.
				newInstance(new IdImpl("3_tonner")).
				setCapacity(3000).
				setCostPerDistanceUnit(varCostPerKm[0] + fixCostPerKm[0]).
//				setFixCost(100000).
				build();
		CarrierVehicleType typeSix = CarrierVehicleType.Builder.
				newInstance(new IdImpl("6_tonner")).
				setCapacity(6000).
				setCostPerDistanceUnit(varCostPerKm[1] + fixCostPerKm[1]).
//				setFixCost(200000).
				build();
		CarrierVehicleType typeSeven = CarrierVehicleType.Builder.
				newInstance(new IdImpl("7_tonner")).
				setCapacity(7000).
				setCostPerDistanceUnit(varCostPerKm[2] + fixCostPerKm[2]).
//				setFixCost(300000).
				build();
		CarrierVehicleType typeTwelve = CarrierVehicleType.Builder.
				newInstance(new IdImpl("12_tonner")).
				setCapacity(12000).
				setCostPerDistanceUnit(varCostPerKm[3] + fixCostPerKm[3]).
//				setFixCost(400000).
				build();
		CarrierVehicleType typeFifteen = CarrierVehicleType.Builder.
				newInstance(new IdImpl("15_tonner")).
				setCapacity(15000).
				setCostPerDistanceUnit(varCostPerKm[4] + fixCostPerKm[4]).
//				setFixCost(500000).
				build();

		CarrierVehicleTypes carrierVehicleTypes = new CarrierVehicleTypes();
		carrierVehicleTypes.getVehicleTypes().put(typeThree.getId(), typeThree);
		carrierVehicleTypes.getVehicleTypes().put(typeSix.getId(), typeSix);
		carrierVehicleTypes.getVehicleTypes().put(typeSeven.getId(), typeSeven);
		carrierVehicleTypes.getVehicleTypes().put(typeTwelve.getId(), typeTwelve);
		carrierVehicleTypes.getVehicleTypes().put(typeFifteen.getId(), typeFifteen);

		if(vehicleTypeFile!=null){
			CarrierVehicleTypeWriter typeWriter = new CarrierVehicleTypeWriter(carrierVehicleTypes);
			typeWriter.write(vehicleTypeFile);
		}

		return carrierVehicleTypes;
	}

}
