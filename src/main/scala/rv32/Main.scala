// See LICENSE for license details.

package rv32

import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.TargetDirAnnotation

object Main extends App {
  val targetDirectory = args.head

  new chisel3.stage.ChiselStage().execute(args, Seq(
    ChiselGeneratorAnnotation(() => new Cpu),
    TargetDirAnnotation(targetDirectory)
  ))
}

